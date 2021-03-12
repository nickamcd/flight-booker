class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @booking.flight = Flight.find(params[:flight_id])
    @num_passengers = params[:passenger_count].to_i
    @num_passengers.times { @booking.passengers.build }
  end

  def create
    puts "here"
    @booking = Booking.new(booking_params)
    if @booking.save
      puts "saves"
      flash[:notice] = 'Booking created successfully!'
      redirect_to booking_path(@booking)
    else
      puts "fails"
      flash[:alert] = 'Oh no! Something went wrong...'
      render "new"
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
