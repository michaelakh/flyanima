class CreateAirlines < ActiveRecord::Migration[5.0]
  def change
    create_table :airlines do |t|
      t.string :name
      t.string :iata
      t.string :phone_no
      t.text :contact_link
      t.text :pet_info_link
      t.text :comments

      t.timestamps
    end
  end
end
