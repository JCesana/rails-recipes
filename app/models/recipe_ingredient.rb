class RecipeIngredient < ApplicationRecord
  belongs_to :ingredient
  belongs_to :recipe

  # Do I need this??
  # accepts_nested_attributes_for :ingredient, :reject_if => :all_blank
  
  validates_uniqueness_of :recipe_id, :scope => :ingredient_id
end
