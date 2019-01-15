class CreateFilms < ActiveRecord::Migration[5.2]
  def change
    create_table :films do |t|
      t.string :name
      t.string :description
      t.string :trailer
      t.string :pictures
      t.integer :duration
      t.datetime :release
      t.string :quality
      t.integer :total_episodes
      
      t.timestamps
    end
  end
end
