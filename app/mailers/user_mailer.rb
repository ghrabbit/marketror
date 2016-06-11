require "./app/models/contact"
class UserMailer < ApplicationMailer
  default from: 'postmaster@home.local.one'
 
  def welcome_email(user)
    @user = user
    @url  = 'http://localhost:3000/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def contact_email(contact)
    @contact = contact
    @url  = 'http://localhost:3000/login'
    mail(to: @contact.email, subject: 'Welcome to My Awesome Site') 
  end
end
