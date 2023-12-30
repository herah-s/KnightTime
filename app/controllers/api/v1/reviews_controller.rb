class Api::V1::ReviewsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, only: [:create, :destroy]
  before_action :set_review, only: :destroy

  def create
    @experience = Experience.find(params[:experience_id])
    @review = Review.new(review_params)
    @review.user = current_user
    @review.booking = current_user.bookings.where(experience: @experience).last

    authorize @review
    if @review.save
      render "api/v1/experiences/show", status: :created
    else
      render_error
    end
  end

  def destroy
    @review.destroy
    head :no_content
  end

  private

  def set_review
    @review = Review.find(params[:id])
    authorize @review
  end

  def review_params
    params.require(:review).permit(:content, :danger_level)
  end

  def render_error
    render json: { errors: @review.errors.full_messages }, status: :unprocessable_entity
  end
end
