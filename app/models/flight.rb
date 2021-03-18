class Flight < ApplicationRecord
  belongs_to  :from_airport, class_name: 'Airport',  foreign_key: 'from_airport_id'
  belongs_to  :to_airport, class_name: 'Airport',  foreign_key: 'to_airport_id'
  has_many    :bookings, dependent: :destroy
  has_many    :passengers, through: :bookings, dependent: :destroy 

  def self.search(search)
    if search
      flights = Flight.all
      flights = flights.where(from_airport_id:  search[:from_airport_id], 
                              to_airport_id:    search[:to_airport_id],
                              takeoff_datetime: Date.parse(search[:takeoff_datetime]).all_day)
    else
      flights = Flight.all
    end
    flights
  end
end
