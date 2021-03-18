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
end

airports = Airport.create([
  { code: 'SFO' },
  { code: 'NYC' }
])

flights = Flight.create([
  { from_airport_id: airports.first.id, to_airport_id: airports.last.id, duration: 300, takeoff_datetime: DateTime.now + 1 },
  { from_airport_id: airports.first.id, to_airport_id: airports.last.id, duration: 300, takeoff_datetime: DateTime.now + 3 },
  { from_airport_id: airports.first.id, to_airport_id: airports.last.id, duration: 300, takeoff_datetime: DateTime.now + 5 },
  { from_airport_id: airports.last.id, to_airport_id: airports.first.id, duration: 360, takeoff_datetime: DateTime.now + 2 },
  { from_airport_id: airports.last.id, to_airport_id: airports.first.id, duration: 360, takeoff_datetime: DateTime.now + 4 },
  { from_airport_id: airports.last.id, to_airport_id: airports.first.id, duration: 360, takeoff_datetime: DateTime.now + 6 }
])