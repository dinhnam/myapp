class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.references :film , index: true
      t.integer :listable_id
      t.string :listable_type
        
      t.timestamps
    end
    add_index :lists, [:listable_id, :listable_type]
  end
end
