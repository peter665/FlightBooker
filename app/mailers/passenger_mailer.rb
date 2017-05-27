class PassengerMailer < ApplicationMailer
  default from: 'odinairlines@example.com'

  def thank_you_email user, booking
    @user = user
    @url = 'http://localhost:3000'
    @booking = booking
    mail(to: @user.email, subject: 'Your Eticket', template_name: 'thank_you')
  end
end
