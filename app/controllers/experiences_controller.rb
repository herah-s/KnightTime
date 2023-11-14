class ExperiencesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @categories = ["Jousting", "Archery", "Samurai", "Vikings", "Knights", "Ninja"]
    @experiences = Experience.all
  end

  def show
  end
end
