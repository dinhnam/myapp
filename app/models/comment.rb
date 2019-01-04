class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :user
  has_many :replies
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 512}

  def add_reply reply
    replies << reply
  end

  def remove_reply reply
    replies.delete reply
  end

  def reply_exist? _reply
    replies.include? director
  end
end
