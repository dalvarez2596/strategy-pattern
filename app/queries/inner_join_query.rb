class InnerJoinQuery < Query
  def execute(model, join_model)
    # Posts column_names (model)
    # ["id", "title", "content", "created_at", "updated_at"]
    table_name = model.table_name
    column_table = model.column_names
    # Comments column_names (join_model)
    # ["id", "post_id", "content", "created_at", "updated_at"]
    table_join_name = join_model.table_name
    join_column_table = join_model.column_names
    model.find_by_sql("SELECT #{column_table[1]}, #{column_table[2]}, #{column_table[3]}, '#{model}' as record_type
                      FROM #{table_name}
                      UNION
                      SELECT NULL AS title, #{table_join_name + '.' + join_column_table[2]},
                      #{table_join_name + '.' + join_column_table[3]}, '#{join_model}' as record_type
                      FROM #{table_join_name}
                      INNER JOIN #{table_name} ON #{table_name + '.' + column_table[0]} = #{table_join_name + '.' + join_column_table[1]}
                      ORDER BY created_at ASC, content ASC;")
  end
end
