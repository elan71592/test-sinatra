class Promoter < ActiveRecord::Base
  belongs_to :club
  has_many :promoter_users
  has_many :users, through: :promoter_users, source: :user
  has_secure_password

  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true
end
