class AddFilmToRates < ActiveRecord::Migration[5.2]
  def change
    add_reference :rates, :film, foreign_key: true
  end
end
