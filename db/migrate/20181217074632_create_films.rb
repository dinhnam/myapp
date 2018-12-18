class CreateFilms < ActiveRecord::Migration[5.2]
  def change
    create_table :films do |t|
      t.string :name
      t.string :intro
      t.integer :imdb
      t.integer :rating
      t.string :cover
      t.string :trailer
      t.string :link
      t.integer :duration
      t.integer :view
      t.datetime :release

      t.timestamps
    end
  end
end
