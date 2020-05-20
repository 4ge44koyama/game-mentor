class Posts::SearchesController < ApplicationController
  def index
    @posts = Post.tagged_with(params[:search_tag]).order("created_at DESC").page(params[:page])
  end
end
