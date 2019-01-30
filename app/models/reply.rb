class Reply < ApplicationRecord
  belongs_to :comment
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 512}

  def check_time
    ((Time.now - self.created_at.localtime)/60).round(0)
  end
end
