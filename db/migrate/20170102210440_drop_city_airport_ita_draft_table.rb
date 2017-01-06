class DropCityAirportItaDraftTable < ActiveRecord::Migration[5.0]
  def change
      drop_table :city_airport_ita
  end
    
  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
