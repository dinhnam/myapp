class Episode < ApplicationRecord
  belongs_to :film
  has_many :comments, as: :commentable

  def add_comment comment
    comments << comment
  end

  def remove_comment comment
    comments.delete comment
  end

  def comment_exist? comment
    comments.include? comment
  end

  def to_param
    number
  end
end
