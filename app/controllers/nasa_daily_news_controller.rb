class NasaDailyNewsController < ApplicationController

  def index 
    if Rails.env.production?
      if params[:id] == ENV['KEY']
        @NDN = NasaDailyNews.all.order(created_at: :desc)
      else
        render html: "Permission is not granted to access this page"
      end
    else
      @NDN = NasaDailyNews.all.order(created_at: :desc)
    end
  end

end
