class Film < ApplicationRecord
  has_many :lists, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
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
  has_many :releases, through: :lists, source: :listable,
    source_type: "Release"
  has_one :view, dependent: :destroy
  has_one :rate, dependent: :destroy
  
  scope :order_rate, ->{joins(:rate).merge(Rate.order(star: :desc))}
  scope :order_view_type, ->(type){joins(:view).merge(View.order("#{type}_views" => :desc))}
  scope :order_date_update, ->{joins(:episodes).merge(Episode.order(updated_at: :desc)).uniq}

  enum status: [:unfinish, :finish]
  enum quality: [:mHD, :HD, :BluRay]

  mount_uploaders :pictures, PicturesUploader
  serialize :pictures, JSON
  
  accepts_nested_attributes_for :episodes
  accepts_nested_attributes_for :studios
  accepts_nested_attributes_for :countries
  accepts_nested_attributes_for :artists

  def to_param
    pretty_param
  end

  def image
    JSON.parse(self.pictures)
  end
  
  def cover
    image = JSON.parse(self.pictures)
    return image["cover"]
  end

  def thumb
    image = JSON.parse(self.pictures)
    return image["thumb"]
  end

  def wallpaper
    image = JSON.parse(self.pictures)
    return image["wallpaper"]
  end
   
  def set_thumb thumb
    image = JSON.parse(self.pictures)
    image["thumb"] = thumb
    self.update_column :cover, JSON.generate(image)
  end

  def set_wallpaper wallpager
    image = JSON.parse(self.pictures)
    image["wallpager"] = wallpager
    self.update_column :cover, JSON.generate(image)
  end

end
