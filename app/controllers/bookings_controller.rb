class BookingsController < ApplicationController
  before_action :set_experience, only: [:create]

  def index
    @bookings = Booking.where(user: current_user).order(created_at: :desc)
  end

  def show
    @booking = Booking.find(params[:id])
    @message = Message.new
  end

  def create
    parsed_start_date = Date.parse(params[:booking][:start_date])
    parsed_end_date = Date.parse(params[:booking][:end_date])
    calculated_total = @experience.price * ((parsed_end_date - parsed_start_date).to_i + 1)

    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.status = 'pending'
    @booking.experience = @experience
    @booking.total_price = calculated_total

    if @booking.save
      redirect_to bookings_path
    else
      render 'experiences/show', status: :unprocessable_entity
    end
  end

  def destroy
    @bookings = Booking.where(user: current_user)
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to booking_path(@bookings), status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_experience
    @experience = Experience.find(params[:experience_id])
  end
end
