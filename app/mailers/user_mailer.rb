# class UserMailer < ApplicationMailer
class UserMailer < ActionMailer::Base
  default from: 'from@example.com'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_changed.subject
  #
  def password_changed(id)
    @resource=User.find(id)
    mail to: @resource.email, subject: "Your password has changed"

  end
end
