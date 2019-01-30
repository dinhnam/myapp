class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :user
  has_many :replies
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 512}
  
end
