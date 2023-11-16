class Host::BookingsController < ApplicationController
  before_action :set_booking, only: :update

  def index
    @bookings = current_user.bookings_as_host
  end

  def update
    @booking.update(booking_params)
    if @booking.save
      redirect_to host_bookings_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:status)
  end
end
