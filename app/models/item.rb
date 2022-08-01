class Item < ApplicationRecord

    validates :name , presence: true
    validates :description , presence: true
    belongs_to :chef
    default_scope ->{order(updated_at: :desc)}
    has_many :item_ingredients
    has_many :ingredients, through: :item_ingredients 
    has_many :comments,  dependent: :destroy

end
