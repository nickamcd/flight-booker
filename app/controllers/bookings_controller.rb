class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @booking.flight = Flight.find(params[:flight_id])
    @num_passengers = params[:passenger_count].to_i
    @num_passengers.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      flash[:notice] = 'Booking created successfully!'
      PassengerMailer.with(booking_id: @booking.id).thank_you_email.deliver_now
      redirect_to booking_path(@booking)
    else
      flash[:alert] = 'Oh no! Something went wrong...'
      render 'new'
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:id, :first_name, :last_name, :email])
  end

end
