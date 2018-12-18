class CreateFeatures < ActiveRecord::Migration[5.2]
  def change
    create_table :features do |t|
      t.string :type, null: false
      t.string :name
      t.string :intro
      t.string :avatar

      t.timestamps
    end
  end
end
