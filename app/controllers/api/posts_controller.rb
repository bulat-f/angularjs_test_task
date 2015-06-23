class Api::PostsController < Api::ApiController
  def index
    per_page = 3
    @posts = Post.search(params[:search]).paginate(page: params[:page], per_page: per_page)
    render json: { total_entries: Post.count, page: params[:page] || 1, per_page: per_page, posts: @posts }
  end

  def show
    @post = Post.find_by(id: params[:id])
    if @post
      render json: @post
    else
      render plain: '404 Not Found', status: 404
    end
  end

  def create
    @post = current_user.posts.build post_params
    if @post.save
      render json: { success: true, id: @post.id }
    else
      render json: { success: false }
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
