class FavoritesController < ApplicationController
  before_action :set_variables

  def create
    @favorite = Favorite.new(user_id: current_user.id, post_id: params[:post_id])
    @favorite.save
    # redirect_back(fallback_location: root_path)
    # render json: @favorite.id
    # render json: @favorite
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, post_id: params[:post_id])
    @favorite.destroy
    # redirect_back(fallback_location: root_path)
    # render json: @favorite.id
    # render json: @favorite
  end

  private

  def set_variables
    @post = Post.find(params[:post_id])
    @id_name = "#favorite-link-#{@post.id}"
  end

end
