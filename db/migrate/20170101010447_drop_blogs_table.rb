class DropBlogsTable < ActiveRecord::Migration[5.0]
  def change
      drop_table :blogs
  end
    
  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
