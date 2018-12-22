class CreateNotices < ActiveRecord::Migration[5.2]
  def change
    create_table :notices do |t|
      t.integer :user_id , index: true
      t.string :title
      t.string :link
      t.boolean :checked

      t.timestamps
    end
  end
end
