class List < ApplicationRecord
  belongs_to :film
  belongs_to :listable, polymorphic: true
end
