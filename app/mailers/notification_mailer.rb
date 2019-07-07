class NotificationMailer < ApplicationMailer

  def error_with_upload(json, msg)
    @json = json.attributes.to_json
    @msg = msg
    mail to: "miketabb33@gmail.com", subject: "Nasa Data Upload Error"
  end
end
