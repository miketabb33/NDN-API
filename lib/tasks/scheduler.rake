require "persistent_data"
require "request_json"

desc "This task is called by the Heroku scheduler add-on"
task :adding_nasa_entry => :environment do
  puts "Adding nasa entry for today..."
  persistentData = PersistentData.new
  requestJSON = RequestJSON.new 

  response = requestJSON.getNasaJSON()
  json = JSON.parse(response.body)
  newNDN = NasaDailyNews.new(copyright: json["copyright"], date: json["date"], explanation: json["explanation"], 
                             hdurl: json["hdurl"], media_type: json["media_type"], service_version: json["service_version"], 
                             title: json["title"], url: json["url"])
  persistentData.attempToSave(newNDN, json["date"])
  puts "done."
end
