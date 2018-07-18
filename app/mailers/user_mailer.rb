class UserMailer < ApplicationMailer
  default from: "bardventure@web.de"

  def contact_form(email, name, message)
  @message = message
    mail(from: email,
        to: 'bardventure@web.de',
        subject: "A new contact form message from #{name}")
  end
end
