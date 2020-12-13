class UserMailer < ApplicationMailer
  default from: 'catstore@yopmail.com'
 
  def welcome_email(user)
    @user = user

    @url  = 'https://gamezone.fr'

    mail(to: @user.email, subject: 'Bienvenue chez GameZone !')
  end
end
