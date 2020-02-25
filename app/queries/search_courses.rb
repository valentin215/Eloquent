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
    @scope = filter_by_teacher_rating(@scope, params[:teacher_rating]) if params [:teacher_rating].present?
    @scope = filter_by_price(@scope, params[:price]) if params[:price].present?
    @scope = filter_by_time(@scope, params[:time]) if params[:time].present?
    @scope
  end

  private

  # def filter_by_categories(scope, content)
  #   @scope_category.where('content @@ ?', content)
  # end

  # def filter_by_tags(scope, tags)
  #   scope.where('tags @@ ?', tags)
  # end

  def filter_by_categories(scope, category_id)
    scope.joins(user: { user_interests: :interest_tag}).where(interest_tags: {interest_category_id: category_id} )
  end

  def filter_by_teacher_rating
    scope.joins(user: )
  end

  def filter_by_price
  end

  def filter_by_time
  end


# where('content @@ ?', content)
  #scope.joins(:user).pluck(:user_interests).joins(:interest_tag).joins(:interest_category).where('content @@ ?', content)
  #( :suburbs => {:households => {:people => :employers }})

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
