class SearchCourses
  attr_accessor :params

  def initialize(attributes = {})
    @params = attributes[:params]
    @scope = Course.all
    # @scope_category = InterestCategory.all
  end

  def call
    @scope = filter_by_level(@scope, params[:level]) if params[:level].present?
    @scope = filter_by_language(@scope, params[:language]) if params[:language].present?
    @scope = filter_by_city(@scope, params[:city]) if params[:city].present?
    @scope = filter_by_categories(@scope, params[:interest_categories]) if params[:interest_categories].present?
    @scope = filter_by_price(@scope, params[:price]) if params[:price].present?
    @scope = filter_by_time(@scope, params[:time]) if params[:time].present?
    @scope = filter_by_day(@scope, params[:day]) if params[:day].present?
    @scope = filter_by_teacher_rating(@scope, params[:teacher_rating]) if params[:teacher_rating].present?
    @scope
  end

  private

  def filter_by_categories(scope, category_id)
    scope.joins(user: { user_interests: :interest_tag}).where(interest_tags: {interest_category_id: category_id} )
  end

  def filter_by_price(scope, price)
    if price = "0-50"
      scope.where("price <= ?", "50")
    elsif price = "50-100"
      scope.where("price >= ? and price <= ?", "50", "100")
    elsif price = "100-150"
      scope.where("price >= ? and price <= ?", "100", "150")
    elsif price = "150-200"
      scope.where("price >= ? and price <= ?", "150", "200")
    else
      scope.where("price >= ?", "200")
    end 
  end
  
  def filter_by_time(scope, time)
    if time == 'M'
      scope.left_outer_joins(:course_days).where("start_time >= ? and end_time <= ?", "00:01", "12:00")
    elsif time == 'A'
      scope.left_outer_joins(:course_days).where("start_time >= ? and end_time <= ?", "12:00", "18:00")
    else
      scope.left_outer_joins(:course_days).where("start_time >= ? and end_time <= ?", "18:00", "23:59")
    end 
  end
  
  def filter_by_teacher_rating(scope, teacher_rating)
    teacher_rating = teacher_rating.to_f
    scope.joins(:user).where("teacher_rating = ?", teacher_rating)
  end

  def filter_by_day(scope, day)
    if day = "Weekdays"
      scope.left_outer_joins(:course_days).where.not('working_day = ?', 'Sunday').where.not('working_day = ?', 'Saturday').uniq
    elsif day = "Weekends"
      scope.left_outer_joins(:course_days).where.('working_day = ?', 'Saturday').uniq
    else
      scope
    end
  end

  def filter_by_city(scope, city)
    scope.near(city)
  end

  def filter_by_language(scope, language)
    scope.joins(:language).where("languages.name ILIKE :language", language: language)
  end

  def filter_by_level(scope, level)
    scope.where('level @@ ?', level)
  end
end
