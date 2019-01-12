class AddPrettyToFilm < ActiveRecord::Migration[5.2]
  def change
    add_column :films, :pretty_param, :string
    add_column :films, :string, :string
  end
end
