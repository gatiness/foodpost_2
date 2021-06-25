class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorites = current_user.favorites
  end
  
  def create
    favorite = current_user.favorites.create(post_id: params[:post_id])
    redirect_to post_path(favorite.post_id), notice: 'お気に入りしました'
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id])
    favorite.destroy
    redirect_to post_path(favorite.post_id), notice: 'お気に入りを解除しました'
  end
end