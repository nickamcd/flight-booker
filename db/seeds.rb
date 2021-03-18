# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  Airport.destroy_all
  Flight.destroy_all
  Booking.destroy_all
  Passenger.destroy_all
end

airports = Airport.create([
  { code: 'SFO' },
  { code: 'NYC' },
  { code: 'LAX' },
  { code: 'JFK' },
  { code: 'MDW' },
  { code: 'LGB' }
])

100.times {
  Airport.all.each do |airport|
    from_airport = airport
    to_airport = Airport.all.sample
    to_airport = Airport.all.sample until to_airport != from_airport
    takeoff_datetime = DateTime.now + rand(1..5)
    duration = rand(260..380)
    Flight.create({ from_airport_id: from_airport.id, to_airport_id: to_airport.id, takeoff_datetime: takeoff_datetime, duration: duration })
  end
}