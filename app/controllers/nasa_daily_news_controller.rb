class NasaDailyNewsController < ApplicationController



  def index 
    puts params
    if params[:id] == "1"
      @NDN = NasaDailyNews.all.order(created_at: :desc)
    else
      render html: "Permission is not granted to access this page"
    end
  end


  private

end
