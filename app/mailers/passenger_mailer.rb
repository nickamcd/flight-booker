class PassengerMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def thank_you_email
    @booking = Booking.find(params[:booking_id])
    # @url = booking_url(@booking)

    mail(to: @booking.passengers.pluck(:email), subject: 'Flight Confirmation')
  end
end
