class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order("id desc")
    @favorite = Favorite.find_by(user_id: current_user.id)
  end

  def edit
    @user = current_user
  end

  def update
    user = User.find(params[:id])
    user.update(user_params) if user.id == current_user.id
    if user.save
      redirect_to controller: :posts, action: :index
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end

end
