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
  
  scope :order_rate, ->{joins(:rate).merge(Rate.order(star: :desc))}
  scope :order_view_type, ->(type){joins(:view).merge(View.order("#{type}_views" => :desc))}
  scope :order_date, ->{joins(:episodes).merge(Episode.order(updated_at: :desc)).uniq}

  enum status: [:unfinish, :finish]
  enum quality: [:mHD, :HD, :BluRay]
  mount_uploader :pictures, PicturesUploader
  
  accepts_nested_attributes_for :episodes

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
