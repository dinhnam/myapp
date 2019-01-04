class Film < ApplicationRecord
  has_many :lists
  has_many :comments, as: :commentable
  has_many :episodes, dependent: :destroy
  has_many :artists, through: :lists, source: :listable,
    source_type: "Artist"
  has_many :directors, through: :lists, source: :listable,
    source_type: "Director"
  has_many :categories, through: :lists, source: :listable,
    source_type: "Category"
  has_many :studios, through: :lists, source: :listable,
    source_type: "Studio"
  has_many :countries, through: :lists, source: :listable,
    source_type: "Country"
  
  def to_param
    pretty
  end
  
end
