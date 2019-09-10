class NasaDailyNewsController < ApplicationController

  def index 
    @NDN = NasaDailyNews.all.order(created_at: :desc)
  end

end
