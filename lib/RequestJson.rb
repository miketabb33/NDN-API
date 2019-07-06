class RequestJSON
  require "net/https"
  require "uri"

  def getNasaJSON()
    api_url = "https://api.nasa.gov/planetary/apod"
    api_key = "O5XtjFT6wV1o5zLwNDhhwf8giPbWhlasYL24H69p"
    api_link = api_url + "?api_key=" + api_key

    uri = URI.parse(api_link)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(uri.request_uri)
    return http.request(request)
  end
end