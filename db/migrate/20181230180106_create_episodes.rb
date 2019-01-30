class CreateEpisodes < ActiveRecord::Migration[5.2]
  def change
    create_table :episodes do |t|
      t.string :name
      t.string :thumb
      t.integer :number
      t.string :link

      t.timestamps
    end
  end
end
