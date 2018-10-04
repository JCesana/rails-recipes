class AddColumnsToRecipeIngredients < ActiveRecord::Migration[5.2]
  def change
    add_column :recipe_ingredients, :quantity, :decimal
    add_column :recipe_ingredients, :unit, :string
  end
end
