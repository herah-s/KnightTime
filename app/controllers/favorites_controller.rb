class FavoritesController < ApplicationController
  def create
    @experience = Experience.find(params[:experience_id])
    @favorite = Favorite.new(
      experience: @experience,
      user: current_user
    )
    @favorite.save
    redirect_to experiences_path
  end
end
