class RequestJSON
  require "net/https"
  require "uri"
  require "persistent_data"

  def getNasaJSONandSave()
    persistentData = PersistentData.new

    api_url = "https://api.nasa.gov/planetary/apod"
    api_key = "O5XtjFT6wV1o5zLwNDhhwf8giPbWhlasYL24H69p"
    api_link = api_url + "?api_key=" + api_key

    uri = URI.parse(api_link)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)

    if response.code == "200" 
      json = JSON.parse(response.body)
      newNDN = NasaDailyNews.new(copyright: json["copyright"], date: json["date"], explanation: json["explanation"], 
                             hdurl: json["hdurl"], media_type: json["media_type"], service_version: json["service_version"], 
                             title: json["title"], url: json["url"])
      persistentData.attempToSave(newNDN, json["date"])
    else
      puts "DEVELOPER NOTES:"
      puts "Error in retrieving json data from nasa.com. Code: #{response.code}"
      NotificationMailer.error_with_json_request(response).deliver_now
    end
  end
end

#  NASA APOD Link
#  https://api.nasa.gov/planetary/apod?api_key=O5XtjFT6wV1o5zLwNDhhwf8giPbWhlasYL24H69p