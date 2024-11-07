class PagesController < ApplicationController
  def home
      client = QueryClient.new(:inner_join, "posts", "comments")
      @records = client.querying

      client_full  = QueryClient.new(:full_outer_join, "posts", "comments")
      @records_outer = client_full.querying
  end
end
