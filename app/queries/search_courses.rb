class SearchCourses
  attr_accessor :params

  def initialize(attributes = {})
    @params = attributes[:params]
    @scope = attributes[:scope] || Course.all
  end

  def call
    @scope = filter_by_level(@scope, params[:level]) if params[:level].present?
  end

  private

  def filter_by_level(scope, level)
    scope.where('level @@ ?', level)
  end
end
