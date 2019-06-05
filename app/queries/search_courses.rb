class SearchCourses
  attr_accessor :params

  def initialize(attributes = {})
    @params = attributes[:params]
    @courses = attributes[:SearchCourses] || Course.all
  end

  def call
    @courses = filter_by_level(@courses, params[:level]) if params[:level].present?
  end

  private

  def filter_by_level(courses, level)
    courses.where('level @@ ?', level)
  end
end
