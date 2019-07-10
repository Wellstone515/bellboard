class PostsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @posts = Post.order("id desc")
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
  end

  def new
    @post = Post.new
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
    params.require(:post).permit(:body).merge(user_id: current_user.id)
  end

end

