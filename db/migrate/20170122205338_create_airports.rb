class CreateAirports < ActiveRecord::Migration[5.0]
  def change
    create_table :airports do |t|
      t.string :name
      t.string :city
      t.string :country
      t.string :iata
      t.string :icao
      t.decimal :latitude
      t.decimal :longitude
      t.integer :altitude
      t.integer :timezone
      t.string :DST
      t.string :tz_database_timezone

      t.timestamps
    end
  end
end
