class CreateRecipesIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes_ingredients do |t|
      t.references :ingredient, foreign_key: true
      t.references :recipe, foreign_key: true

      t.timestamps
    end
  end
end
