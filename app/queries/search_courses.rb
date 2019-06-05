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
    @scope = filter_by_categories(params[:interest_categories]) if params[:interest_categories].present?
    @scope
     # @scope = filter_by_tags(@scope, params[:tags]) if params[:tags].present?
  end

  private

  # def filter_by_categories(scope, content)
  #   @scope_category.where('content @@ ?', content)
  # end

  # def filter_by_tags(scope, tags)
  #   scope.where('tags @@ ?', tags)
  # end

  def filter_by_categories(content)
    Course.find :all, :include =>  { :user => { :user_interests => { :interest_tag => { interest_category: :content} } } }
    # @second_query = @first_query.joins(user_interests: :interest_tags)
    raise
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

    # @courses = Course.all

    # if params[:city].present?
    #   @courses = Course.near(params[:city])
    #   # @previous_city = @courses
    # end

    # if params[:language].present?
    #   @courses = @courses.joins(:language).where("languages.name ILIKE :language", language: params[:language] )
    #   # @previous_language = @courses
    # end
