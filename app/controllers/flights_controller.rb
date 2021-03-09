class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.map { |a| [a.code, a.id] }
    @date_options = Flight.all.map  { |f| f.takeoff_datetime.to_date }.uniq.sort

    @available_flights = Flight.search(params[:flight])
  end

  private

  def flight_params
    params.require(:flight).permit(:from_airport_id, :to_airport_id, :takeoff_datetime, :passenger_count)
  end
end
