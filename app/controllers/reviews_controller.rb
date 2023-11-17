class ReviewsController < ApplicationController
  def create
    @experience = Experience.find(params[:experience_id])
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
    redirect_to experience_path(@review.booking.experience), status: :see_other
  end

  private

  def review_params
    params.require(:review).permit(:content, :danger_level)
  end
end
