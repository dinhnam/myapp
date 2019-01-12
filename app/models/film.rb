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
  has_one :view
  has_one :rate
  
  scope :favorite, -> (kind){joins(:view).merge(View.order("#{kind}_views" => :desc))}
  scope :top_rates, ->{order(rates: :desc)}
  scope :top_views, ->{order(rates: :desc)}

  def to_param
    pretty_param
  end
  
  def thumb
    cover_hash = JSON.parse(self.cover)
    return cover_hash["thumb"]
  end

  def wallpager
    cover_hash = JSON.parse(self.cover)
    return cover_hash["wallpager"]
  end
end
