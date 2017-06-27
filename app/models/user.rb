class User < ApplicationRecord
  attr_accessor :email, :password, :password_confirmation
  has_secure_password

  validates_uniqueness_of :email

  has_many :posts, dependent: :nullify
  has_many :comments, dependent: :nullify

  before_create { generate_token(:auth_token)}

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
