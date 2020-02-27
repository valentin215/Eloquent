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
    # @scope = filter_by_teacher_rating(@scope, params[:teacher_rating]) if params [:teacher_rating].present?
    @scope = filter_by_price(@scope, params[:price]) if params[:price].present?
    @scope = filter_by_time(@scope, params[:time]) if params[:time].present?
    @scope = filter_by_day(@scope, params[:day]) if params[:day].present?
    @scope = filter_by_date(@scope, params[:date]) if params[:date].present?
    @scope
  end

  private

  def filter_by_categories(scope, category_id)
    scope.joins(user: { user_interests: :interest_tag}).where(interest_tags: {interest_category_id: category_id} )
  end

  # def filter_by_teacher_rating(scope, teacher_rating)
  #   scope.joins(:user).where("teacher_rating = ?", teacher_rating)
  # end

  # def filter_by_price(scope, price)
  #   scope.where("price <= ?", price)
  # end

  def filter_by_time(scope, time)
    if time == 'morning'
      scope.left_outer_joins(:course_days).where("start_time >= ? and end_time <= ?", "00:01", "12:00")
    elsif time == 'afternoon'
      scope.left_outer_joins(:course_days).where("start_time >= ? and end_time <= ?", "12:00", "18:00")
    else
      scope.left_outer_joins(:course_days).where("start_time >= ? and end_time <= ?", "18:00", "23:59")
    end 
  end

  # def filter_by_date
  #   scope.where("start_date >= ? and end_date <= ?", start_date, end_date)
  # end

  # def filter_by_day
  #   scope.left_outer_joins(:course_day).where("start_time >= ? and end_time <= ?", start_time, end_time)
  # end

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
