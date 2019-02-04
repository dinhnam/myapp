class CreateFilms < ActiveRecord::Migration[5.2]
  def change
    create_table :films do |t|
      t.string :name
      t.string :description
      t.string :pictures
      t.integer :duration
      t.integer :quality
      t.integer :total_episodes
      t.integer :status, default: 0, null: false
      t.integer :release
      
      t.timestamps
    end
  end
end
