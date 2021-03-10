class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @booking.flight = Flight.find(params[:flight_id])
    @num_passengers = params[:passenger_count].to_i
    @num_passengers.times { @booking.passengers.build }
  end

end
