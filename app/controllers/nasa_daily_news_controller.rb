class NasaDailyNewsController < ApplicationController
  require "net/https"
  require "uri"

  def index 
    api_url = "https://api.nasa.gov/planetary/apod"
    api_key = "O5XtjFT6wV1o5zLwNDhhwf8giPbWhlasYL24H69p"
    api_link = api_url + "?api_key=" + api_key

    response = getJson(api_link)
    json = JSON.parse(response.body)
    newNDN = NasaDailyNews.new(copyright: json["copyright"], date: json["date"], explanation: json["explanation"], 
                               hdurl: json["hdurl"], media_type: json["media_type"], service_version: json["service_version"], 
                               title: json["title"], url: json["url"])
    attempToSave(newNDN, json["date"])
    @NDN = NasaDailyNews.all
  end

  private

    #Json handling
    def getJson(link)
      uri = URI.parse(link)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Get.new(uri.request_uri)
      return http.request(request)
    end

    #DB saving methods
    def attempToSave(nasaEntry, jsonDate)
      if NasaDailyNews.any? == false 
        save(nasaEntry)
      else
        saveUnlessEntryIsAlreadySaved(nasaEntry, jsonDate)
      end
    end

    def saveUnlessEntryIsAlreadySaved(nasaEntry, jsonDate)
      if NasaDailyNews.last.date != jsonDate
          save(nasaEntry)
      else 
        puts "DEVELOPER NOTES:"
        puts "Entry already exists"
      end
    end

    def save(nasaEntry) 
      if nasaEntry.save
        puts "DEVELOPER NOTES:"
        puts "Entry added"
      else 
        puts "DEVELOPER NOTES:"
        puts "Error saving nasa data into database"
      end
    end

end
