class NasaDailyNewsController < ApplicationController

  def index 
    @NDN = NasaDailyNews.all
  end

end
