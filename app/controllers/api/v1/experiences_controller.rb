class Api::V1::ExperiencesController < Api::V1::BaseController
  before_action :set_experience, only: [:show]
  def index
    @experiences = policy_scope(Experience)
  end

  def show
  end

  private

  def set_experience
    @experience = Experience.find(params[:id])
    authorize @experience
  end
end
