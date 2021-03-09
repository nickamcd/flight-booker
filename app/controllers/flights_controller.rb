class FlightsController < ApplicationController
  def index
    @airport_options  =   Airport.all.map { |a| [a.code, a.id] }
    @date_options     =   Flight.all.map  { |f| f.takeoff_datetime.to_date }.uniq.sort

  end
end
