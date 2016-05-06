class User < ActiveRecord::Base
  has_many :promoter_users
  has_many :promoters, through: :promoter_users, source: :promoter
  has_secure_password

  # validates :name, :email, :password, presence: true
  validates :email, uniqueness: true
end
