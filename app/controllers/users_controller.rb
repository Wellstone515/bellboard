class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order("id desc")
    @favorite = Favorite.find_by(user_id: current_user.id)
  end

end
