class Host::BookingsController < ApplicationController
  before_action :set_booking, only: :update

  def index
    @bookings = Booking.all
  end

  def update
    @booking.update(booking_params)
    @booking.save
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:status)
  end
end
