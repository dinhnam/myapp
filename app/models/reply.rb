class Reply < ApplicationRecord
  belongs_to :comment
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 512}
end
