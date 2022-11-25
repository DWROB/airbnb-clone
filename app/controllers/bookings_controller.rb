class BookingsController < ApplicationController

  def create
    @apartment = Apartment.find(params[:apartment_id])
    @booking = Booking.new(booking_params)
    @booking.apartment_id = @apartment.id
    @booking.user_id = current_user.id
    authorize(@booking)
    if @booking.save
      redirect_to apartments_path(@apartment)
    else
      redirect_to apartments_path(@apartment), status: :unprocessable_entity
    end

  end

  private


  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
