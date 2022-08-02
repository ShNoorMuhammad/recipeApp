class Chef < ApplicationRecord
  validates :chefname, presence: true
  validates :email, presence: true

  has_many :items

  has_secure_password
  validates :password, presence: true
  has_many :comments, dependent: :destroy
end
