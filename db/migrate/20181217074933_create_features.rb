class CreateFeatures < ActiveRecord::Migration[5.2]
  def change
    create_table :features do |t|
      t.string :type, null: false
      t.string :name
      t.string :description
      t.string :pictures

      t.timestamps
    end
  end
end
