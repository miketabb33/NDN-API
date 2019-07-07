class NotificationMailer < ApplicationMailer

  def error_with_upload(data, msg)
    @data = data.attributes.to_json
    @msg = msg
    mail to: "miketabb33@gmail.com", subject: "Nasa Data Upload Error"
  end

  def error_with_json_request(response)
    @response = response
    mail to: "miketabb33@gmail.com", subject: "Nasa JSON Request Error"
  end
end
