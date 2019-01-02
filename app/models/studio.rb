class Studio < Feature
  include MovieModule
  has_many :lists, ->{where listable_type: "Studio"},
    foreign_key: "listable_id", dependent: :destroy
  has_many :films, through: :lists
end
