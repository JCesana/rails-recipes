class ChangeNameOfRecipesIngredients < ActiveRecord::Migration[5.2]
  def change
    rename_table :recipes_ingredients, :recipe_ingredients
  end
end
