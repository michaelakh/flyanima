class AddIndexToCityAirport < ActiveRecord::Migration[5.0]
  def change
      add_index :city_airport_ita_codes, :airport
      add_index :city_airport_ita_codes, :city
  end
end
