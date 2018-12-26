class Country < Feature
  include MovieModule
  has_many :lists, ->{ where listable_type: "Country"},
    :foreign_key => "listable_id", dependent: :destroy
  has_many :films, through: :lists
      
end