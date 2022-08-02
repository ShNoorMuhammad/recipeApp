class ItemIngredient < ApplicationRecord
  belongs_to :ingredient
  belongs_to :item
end
