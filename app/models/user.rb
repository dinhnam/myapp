class User < ApplicationRecord
  attr_accessor :activation_token
  before_save {self.email = email.downcase}
  before_create :create_activation_digest
  has_secure_password
  has_many :comments, dependent: :destroy
  has_many :replies, dependent: :destroy
  validates :name,  presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }, 
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: {minimum: 6}

  def User.digest string
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                              BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end
  
  def generate_token atrribute_digest
    token = User.new_token
    update_attribute atrribute_digest, User.digest(token)
    return token
  end

  def authenticated? atrribute_digest, token
    return false if self[atrribute_digest].nil?
    BCrypt::Password.new(self[atrribute_digest]).is_password? token
  end

  def forget
    update_attribute :remember_digest, nil
  end

  def create_activation_digest
    self.activation_token = User.new_token
    self.activation_digest =  User.digest(self.activation_token)
  end

  def activate
    update_columns activated: true, activated_at: Time.zone.now
  end
end
