class AddFilmToEpisodes < ActiveRecord::Migration[5.2]
  def change
    add_reference :episodes, :film, foreign_key: true
  end
end
