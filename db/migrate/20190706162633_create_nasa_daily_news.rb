class CreateNasaDailyNews < ActiveRecord::Migration[5.2]
  def change
    create_table :nasa_daily_news do |t|
      t.string :copyright
      t.string :date
      t.string :explanation
      t.string :hdurl
      t.string :media_type
      t.string :service_version
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
