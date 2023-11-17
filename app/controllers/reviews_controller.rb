class ReviewsController < ApplicationController
  before_action :set_experience, only: [:create]

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.booking = current_user.bookings.where(experience: @experience).last

    if @review.save
      redirect_to experience_path(@experience)
      flash[:notice] = "Thank you for leaving a review!"
    else
      render 'experiences/show', status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    render 'experiences/show', status: :see_other
  end

  private

  def set_experience
    @experience = Experience.find(params[:experience_id])
  end

  def review_params
    params.require(:review).permit(:content, :danger_level)
  end
end
