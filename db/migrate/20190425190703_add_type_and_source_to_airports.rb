class AddTypeAndSourceToAirports < ActiveRecord::Migration[5.0]
  def up
    add_column :airports, :a_type, :string
    add_column :airports, :a_source, :string
  end
  
  def down
    remove_column :airports, :a_type, :string
    remove_column :airports, :a_source, :string
  end
end
