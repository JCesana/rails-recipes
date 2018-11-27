class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :comments, :directions, :ingredients, :recipe_ingredients

  has_many :comments
  belongs_to :user
  has_many :ingredients
  has_many :recipe_ingredients
  has_many :directions
end
