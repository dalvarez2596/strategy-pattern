class QueryContext
  def initialize(query)
    @query = query
  end

  def set_query=(query)
    @query = query
  end

  def execute_query(model, join_model)
    model_class = model.classify.constantize
    join_model_class = join_model.classify.constantize
    @query.execute(model_class, join_model_class)
  end
end
