class SearchCategories
  attr_accessor :params

  def initialize(attributes = {})
    @params = attributes[:params]
    @scope = attributes[:scope] || InterestCategory.all
  end

  def call
    # @scope = filter_by_categories(@scope, params[:interest_categories]) if params[:interest_categories].present?
  end

  def filter_by_categories(scope, content)
    scope.where('content @@ ?', content)
  end
end
