class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :content
      t.references :film, foreign_key: true
      t.integer :user_id

      t.timestamps
    end
    add_index :comments, [:user_id, :created_at]
  end
end
