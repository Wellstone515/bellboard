class PostsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @posts = Post.order("id desc")
    if user_signed_in?
      @favorite = Favorite.find_by(user_id: current_user.id)
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
  end

  def new
    @post = Post.new
    1.times { @post.images.build }
  end

  def create
    post = Post.create(post_params)
    if post.save
      redirect_to controller: :posts, action: :index
    else
      render :new
    end
  end

  private
  def post_params
    params.require(:post).permit(:body, images_attributes: [:image_id]).merge(user_id: current_user.id)
  end

end

