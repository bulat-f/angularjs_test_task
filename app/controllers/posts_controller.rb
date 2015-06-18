class PostsController < ApplicationController
  def index
    per_page = 3
    @posts = Post.paginate(page: params[:page], per_page: per_page)
    render json: { total_entries: Post.count, per_page: per_page, posts: @posts }
  end

  def show
    @post = Post.find_by(id: params[:id])
    render json: @post
  end
end
