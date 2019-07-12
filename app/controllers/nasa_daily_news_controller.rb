class NasaDailyNewsController < ApplicationController

  def index 
    @NDN = NasaDailyNews.all.reverse
  end

end
