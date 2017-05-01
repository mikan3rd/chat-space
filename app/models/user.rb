class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :messages
  has_many :group_users, dependent: :destroy
  has_many :groups, through: :group_users
end
