class NasaDailyNewsController < ApplicationController

  def index 
    if params[:id] == ENV['KEY']
      @NDN = NasaDailyNews.all.order(created_at: :desc)
    else
      render html: "Permission is not granted to access this page"
    end
  end

end
