class PostsController < ApplicationController
  def index
    @posts = Post.paginate(page: params[:page], per_page: 3)
    render json: @posts
  end

  def show
    @post = Post.find_by(id: params[:id])
    render json: @post
  end
end
