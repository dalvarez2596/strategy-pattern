class QueryClient
  def initialize(action, model, join_model)
    @action = action
    @model = model
    @join_model = join_model
  end

  def querying
    context = QueryContext.new(query_for_action(@action))
    context.execute_query(@model, @join_model)
  end

  private
  def query_for_action(action)
    case action
    when :inner_join
      InnerJoinQuery.new
    when :full_outer_join
      FullOuterJoinQuery.new
    else
      raise "Unknow action"
    end
  end
end
