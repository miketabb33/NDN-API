class NasaDailyNewsController < ApplicationController
  require "persistent_data"
  require "request_json"

  def index 
    @NDN = NasaDailyNews.all
  end

end
