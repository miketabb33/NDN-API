require "request_json"

desc "This task is called by the Heroku scheduler add-on"
task :adding_nasa_entry => :environment do
  puts "Adding nasa entry for today..."

  requestJSON = RequestJSON.new 

  requestJSON.getNasaJSONandSave()
  
  puts "done."
end
