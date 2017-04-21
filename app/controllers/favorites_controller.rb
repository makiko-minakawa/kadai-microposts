class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    @micropost = Micropost.find(params[:micropost_id])
    @favorite = current_user.favorites.build(micropost_id: @micropost.id)
    @favorite.save
    flash[:success] = 'お気に入りに登録しました。'
    redirect_to favorites_user_path(current_user)
  end

  def destroy
    @micropost = Micropost.find(params[:micropost_id])
    @favorite = current_user.favorites.find_by!(micropost_id: @micropost.id)
    @favorite.destroy
    flash[:success] = 'お気に入りを解除しました。'
    redirect_to favorites_user_path(current_user)
  end
end
