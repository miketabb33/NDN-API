class NasaDailyNewsController < ApplicationController

  def index 
    if Rails.env.production?
      key_check
    else
      @NDN = get_entries
    end
  end

  private 

  def key_check 
    if params[:id] == ENV['KEY']
      @NDN = get_entries
    else
      render html: "Permission is not granted to access this page"
    end
  end

  def get_entries
    NasaDailyNews.all.order(created_at: :desc)
  end
  
end
