class Ingredient < ApplicationRecord
  has_many :recipe_ingredients, inverse_of: :ingredient
  has_many :recipes, through: :recipe_ingredients

  validates :name, uniqueness: true

  accepts_nested_attributes_for :recipe_ingredients, :reject_if => :all_blank, :allow_destroy => true
end
