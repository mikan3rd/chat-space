class Group < ApplicationRecord
  has_many :messages
  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users
  accepts_nested_attributes_for :group_users, allow_destroy: true

  validates :name, presence: true
end
