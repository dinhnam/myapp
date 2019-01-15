class Rate < ApplicationRecord
  belongs_to :film
  before_save :average
  def number_voter
    self.star_5 + self.star_4 + self.star_3 + self.star_2 + self.star_1
  end

  def average
    self.star = (1.0*(5*self.star_5 + 4*self.star_4 + 3*self.star_3 +
      2*self.star_2 + self.star_1)/self.number_voter).round(1)
  end
end
