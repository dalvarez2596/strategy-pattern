class FullOuterJoinQuery < Query
  def execute(model, join_model)
    # Posts
    table_name = model.table_name
    column_table = model.column_names

    # Comments
    table_join_name = join_model.table_name
    join_column_table = join_model.column_names

    model.find_by_sql("SELECT
      posts.id AS post_id,
      posts.title,
      posts.content AS post_content,
      posts.created_at AS post_created_at,
      comments.id AS comment_id,
      comments.content AS comment_content,
      comments.created_at AS comment_created_at,
      CASE
        WHEN posts.id IS NOT NULL THEN 'Post'
        ELSE 'Comment'
      END AS record_type
    FROM #{table_name}
    FULL OUTER JOIN #{table_join_name}
      ON posts.id = comments.post_id
    ORDER BY posts.created_at ASC, comments.created_at ASC;"
    )
  end
end
