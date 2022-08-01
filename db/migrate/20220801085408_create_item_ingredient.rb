class CreateItemIngredient < ActiveRecord::Migration[7.0]
  def change
    create_table :item_ingredients do |t|
      t.integer :item_id
      t.integer :ingredient_id

      t.timestamps
    end
  end
end
