class Api::V1::ExperiencesController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, only: [:update]
  before_action :set_experience, only: [:show, :update]
  def index
    @experiences = policy_scope(Experience)
  end

  def show
  end

  def update
    if @experience.update(experience_params)
      render :show
    else
      render_error
    end
  end

  private

  def set_experience
    @experience = Experience.find(params[:id])
    authorize @experience
  end

  def experience_params
    params.require(:experience).permit(:name, :description, :price, :category, :address, :photo)
  end

  def render_error
    render json: { errors: @experience.errors.full_messages }, status: :unprocessable_entity
  end
end
