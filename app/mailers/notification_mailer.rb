class NotificationMailer < ApplicationMailer

  def error_with_upload
    mail to: "miketabb33@gmail.com", subject: "Nasa Data Upload Error"
  end
end
