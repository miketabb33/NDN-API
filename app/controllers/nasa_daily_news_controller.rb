class NasaDailyNewsController < ApplicationController

  def index 
    NotificationMailer.error_with_upload.deliver_now
    @NDN = NasaDailyNews.all
  end

end
