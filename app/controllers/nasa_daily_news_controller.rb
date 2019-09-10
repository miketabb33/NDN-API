include Key

class NasaDailyNewsController < ApplicationController

  def index 
    if params[:id] == Key.key
      @NDN = NasaDailyNews.all.order(created_at: :desc)
    else
      render html: "Permission is not granted to access this page"
    end
  end

end
