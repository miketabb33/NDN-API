# Preview all emails at http://localhost:3000/rails/mailers/notification_mailer
class NotificationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notification_mailer/error_with_upload
  def error_with_upload
    NotificationMailer.error_with_upload
  end

end
