class NasaDailyNewsController < ApplicationController
  require "PersistentData"
  require "RequestJSON"

  def index 
    persistentData = PersistentData.new
    requestJSON = RequestJSON.new 

    response = requestJSON.getNasaJSON()
    json = JSON.parse(response.body)
    newNDN = NasaDailyNews.new(copyright: json["copyright"], date: json["date"], explanation: json["explanation"], 
                               hdurl: json["hdurl"], media_type: json["media_type"], service_version: json["service_version"], 
                               title: json["title"], url: json["url"])
    persistentData.attempToSave(newNDN, json["date"])
    @NDN = NasaDailyNews.all
  end

end
