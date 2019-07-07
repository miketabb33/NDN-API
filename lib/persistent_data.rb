class PersistentData
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
      NotificationMailer.error_with_upload(nasaEntry, "Occured because the last entry has the same date as the currently staged to save entry. This error should not occur when th cron job is set to trigger every 24 hours. Possible reason: Nasa did not release a new entry").deliver_now
    end
  end

  def save(nasaEntry) 
    if nasaEntry.save
      puts "DEVELOPER NOTES:"
      puts "Entry added"
    else 
      puts "DEVELOPER NOTES:"
      puts "Error saving nasa data into database"
      NotificationMailer.error_with_upload(nasaEntry, "Occured when the system saved the entry to the database.").deliver_now
    end
  end
end
