class CreateFilms < ActiveRecord::Migration[5.2]
  def change
    create_table :films do |t|
      t.string :name
      t.string :description
      t.string :trailer
      t.string :cover
      t.integer :duration
      t.datetime :release
      t.string :quality
      t.integer :total_episodes
      t.decimal :rates, default: 0
      t.integer :views, default: 0
      
      t.timestamps
    end
  end
end
