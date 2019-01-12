class View < ApplicationRecord
  belongs_to :film
  after_save :film_view
  scope :top,-> (kind){order("#{kind}" => :desc)}
  def film_view
    self.film.update_column :views, self.year_views
  end
end
