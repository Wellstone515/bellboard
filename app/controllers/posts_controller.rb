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
    @user = @post.user
    @comments = @post.comments.order("id desc")
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

  def edit
    @post = Post.find(params[:id])
    0.times { @post.images.build }
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params) if @post.user_id == current_user.id
    if @post.save
      redirect_to controller: :posts, action: :show
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy if post.user_id == current_user.id
    redirect_to controller: :posts, action: :index, alert: '削除しますか？'
  end

  private
  def post_params
    params.require(:post).permit(:body, images_attributes: [:image_id]).merge(user_id: current_user.id)
  end

end

