class CreateFilms < ActiveRecord::Migration[5.2]
  def change
    create_table :films do |t|
      t.string :name
      t.string :intro
      t.integer :rate
      t.integer :all_views
      t.integer :month_views
      t.integer :week_views
      t.integer :day_views
      t.string :cover
      t.integer :duration
      t.datetime :release
      
      t.timestamps
    end
  end
end
