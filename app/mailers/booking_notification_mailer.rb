class BookingNotificationMailer < ApplicationMailer
  def booking_notification(booking)
    @booking = booking
    @owner = @booking.boat.user
    @booker = @booking.user
    @start_date = @booking.start_date
    @end_date = @booking.end_date
    mail(to: @owner.email, subject: 'Your boat has been booked!')
  end
end
