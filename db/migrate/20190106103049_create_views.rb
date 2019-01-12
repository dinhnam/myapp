class CreateViews < ActiveRecord::Migration[5.2]
  def change
    create_table :views do |t|
      t.integer :year_views, default: 0
      t.integer :month_views, default: 0
      t.integer :week_views, default: 0
      t.integer :day_views, default: 0

      t.timestamps
    end
  end
end
