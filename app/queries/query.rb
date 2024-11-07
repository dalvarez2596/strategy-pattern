class Query
  def execute (model, join_model)
    raise NotImplementedError, "Each model must implement the execute method"
  end
end
