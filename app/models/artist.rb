class Artist < Feature
  include MovieModule
  has_many :lists, ->{where listable_type: "Artist"},
    foreign_key: "listable_id", dependent: :destroy
  has_many :films, through: :lists

  def to_param
    name
  end
end
