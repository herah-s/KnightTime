class Host::ExperiencesController < ApplicationController

  def index
    @experiences = current_user.experiences_as_host
  end

  def destroy
    @experiences = current_user.experiences_as_host
    @experience = Experience.find(params[:id])
    @experience.destroy
    redirect_to host_experience_path(@experiences), status: :see_other
  end
end
