class Rate < ApplicationRecord
  belongs_to :film
  attr_accessor :sum
  attr_accessor :average
  after_save :calculate_average
  def number_people
    self.sum ||= self.star_5 + self.star_4 + self.star_3 + self.star_2 + self.star_1
  end

  def calculate_average
    average = (1.0*(5*self.star_5 + 4*self.star_4 + 3*self.star_3 +
      2*self.star_2 + self.star_1)/number_people).round(1)
    self.film.update_column :rates, average
  end
end
