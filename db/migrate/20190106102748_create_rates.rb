class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
      t.integer :star_5, default: 0
      t.integer :star_4, default: 0
      t.integer :star_3, default: 0
      t.integer :star_2, default: 0
      t.integer :star_1, default: 0

      t.timestamps
    end
  end
end
