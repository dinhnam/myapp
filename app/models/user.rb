class User < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :replies, dependent: :destroy
  validates :name,  presence: true, length: {maximum: 50}
  validates :email, presence: true, length: {maximum: 255}
  validates :password, presence: true, length: {minimum: 6}
  has_secure_password
end
