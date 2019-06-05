class SearchCourses
  attr_accessor :params

  def initialize(attributes = {})
    @params = attributes[:params]
    @scope = attributes[:scope] || Course.all
  end

  def call
    @scope = filter_by_level(@scope, params[:level]) if params[:level].present?
    @scope = filter_by_language(@scope, params[:language]) if params[:language].present?
    @scope = filter_by_city(@scope, params[:city]) if params[:city].present?
    @scope = filter_by_categories(@scope, params[:categories]) if params[:categories].present?
    # @scope = filter_by_tags(@scope, params[:tags]) if params[:tags].present?
    @scope
  end

  private

  def filter_by_categories(scope, categories)
    scope.where('categories @@ ?', categories)
  end

  def filter_by_tags(scope, tags)
    scope.where('tags @@ ?', tags)
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

    # @courses = Course.all

    # if params[:city].present?
    #   @courses = Course.near(params[:city])
    #   # @previous_city = @courses
    # end

    # if params[:language].present?
    #   @courses = @courses.joins(:language).where("languages.name ILIKE :language", language: params[:language] )
    #   # @previous_language = @courses
    # end
