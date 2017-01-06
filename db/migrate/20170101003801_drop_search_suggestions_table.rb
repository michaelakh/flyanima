class DropSearchSuggestionsTable < ActiveRecord::Migration[5.0]
  def change
      drop_table :search_suggestions
  end
    
  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
