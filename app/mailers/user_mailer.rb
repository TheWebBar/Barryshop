class UserMailer < ApplicationMailer
  default from: "bardventure@web.de"

  def contact_form(email, name, message)
  @message = message
    mail(from: email,
        to: 'bardventure@web.de',
        subject: "A new contact form message from #{name}")
  end


  def welcome(user)
  @appname = "Barryshop"
    mail(to: user.email,
       subject: "Welcome to #{@appname}!")
  end

  def order_created(user, product)
    @product = product
    @user = user
    mail(to: user.email,
    subject: "Your order has been received. Thank you!", body: "Thanks!")
  end

end
