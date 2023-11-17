class FavoritesController < ApplicationController
  def create
    @experience = Experience.find(params[:experience_id])
    @previous_favorite = Favorite.find_by(user: current_user, experience: @experience)
    if @previous_favorite
      @previous_favorite.destroy
    else
      @favorite = Favorite.new(
        experience: @experience,
        user: current_user
      )
      @favorite.save
    end
    head :ok
  end
end
