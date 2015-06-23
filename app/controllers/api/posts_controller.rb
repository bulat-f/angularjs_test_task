class Api::PostsController < Api::ApiController
  PER_PAGE = 3

  before_action :authenticate_user!, only: [:create]

  def index
    params[:page] = params[:page].to_i if params[:page]
    @posts = Post.search(params[:search]).paginate(page: params[:page], per_page: PER_PAGE)
    render json: { total_entries: Post.count, page: params[:page] || 1, per_page: PER_PAGE, posts: @posts }
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
      render json: { id: @post.id }, status: :created
    else
      render nothing: true, status: :forbidden
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
