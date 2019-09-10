class NasaDailyNewsController < ApplicationController



  def index 
    t = false
    if t 
      render html: "Permission is not granted to access this page"
    else
      @NDN = NasaDailyNews.all.order(created_at: :desc)
    end
  end


  private

end
