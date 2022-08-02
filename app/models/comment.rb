class Comment < ApplicationRecord
  validates :description, presence: true

  belongs_to :chef
  belongs_to :item

  validates :chef_id, presence: true
  validates :item_id, presence: true
end
