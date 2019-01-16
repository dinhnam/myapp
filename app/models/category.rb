class Category < Feature
  include MovieModule
  has_many :lists, ->{where listable_type: "Category"},
    foreign_key: "listable_id", dependent: :destroy
  has_many :films, through: :lists
  scope :search_name,->(name){where name: "#{name}"}

  def to_param
    name
  end
end
