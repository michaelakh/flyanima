class CreateCityAirportItaCodes < ActiveRecord::Migration[5.0]
  def change
    create_table :city_airport_ita_codes do |t|
      t.string :code
      t.string :city
      t.string :airport
      t.string :country
      t.integer :searches

      t.timestamps
    end
  end
end
