require 'test_helper'

class NotificationMailerTest < ActionMailer::TestCase
  test "error_with_upload" do
    mail = NotificationMailer.error_with_upload
    assert_equal "Error with upload", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
