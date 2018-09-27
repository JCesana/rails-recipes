class Ingredient < ApplicationRecord
  has_many :recipesingredients
  has_many :recipes, through: :recipesingredients
end
