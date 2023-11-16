class ExperiencesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_experience, only: :show

  def index
    @categories = ["Jousting", "Archery", "Samurai", "Vikings", "Knights", "Ninja"]
    if params[:category].present?
      @experiences = Experience.where("category = ?", params[:category])
    elsif params[:query].present?
      @experiences = Experience.where("description LIKE ?", "%#{params[:query]}%")
    else
      @experiences = Experience.all
    end
  end

  def show
    @booking = Booking.new
  end

  def new
    @experience = Experience.new
    @categories = ["Jousting", "Archery", "Samurai", "Vikings", "Knights", "Ninja"]
  end

  def create
    @experience = Experience.new(experience_params)
    @experience.host = current_user

    if @experience.save
      redirect_to host_experiences_path(@experience)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_experience
    @experience = Experience.find(params[:id])
  end

  def experience_params
    params.require(:experience).permit(:name, :description, :photo, :price, :category, :address)
  end
end
