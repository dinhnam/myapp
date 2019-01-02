class CreateReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :replies do |t|
      t.string :content
      t.references :comment, foreign_key: true
      t.integer :user_id

      t.timestamps
    end
    add_index :replies, [:user_id, :created_at]
  end
end
