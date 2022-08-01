class Ingredient < ApplicationRecord
    validates :name, presence: true 
    validates_uniqueness_of :name

    has_many :item_ingredients
    has_many :items, through: :item_ingredients
end

