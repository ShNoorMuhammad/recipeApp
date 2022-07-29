class Item < ApplicationRecord

    validates :name , presence: true
    validates :description , presence: true
    belongs_to :chef
    default_scope ->{order(updated_at: :desc)}

end
