class PersistentData
  def attempToSave(nasaEntry, jsonDate)
    NotificationMailer.error_with_upload.deliver_now
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
