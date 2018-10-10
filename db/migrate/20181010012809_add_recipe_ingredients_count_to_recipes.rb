class AddRecipeIngredientsCountToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :recipe_ingredients_count, :integer, default: 0
  end
end
