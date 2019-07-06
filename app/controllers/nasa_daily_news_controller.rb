class NasaDailyNewsController < ApplicationController
  require "net/https"
  require "uri"

  def index 
    api_url = "https://api.nasa.gov/planetary/apod"
    api_key = "O5XtjFT6wV1o5zLwNDhhwf8giPbWhlasYL24H69p"
    full_link = api_url + "?api_key=" + api_key

    uri = URI.parse(full_link)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(uri.request_uri)

    response = http.request(request)
    @json = JSON.parse(response.body)
  end
end
