class AddFlightReferenceToBooking < ActiveRecord::Migration[6.1]
  def change
    add_reference :bookings, :flight, foreign_key: true
  end
end
