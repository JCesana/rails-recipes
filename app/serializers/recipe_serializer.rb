class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :comments, :directions, :ingredients, :recipe_ingredients, :image_url

  has_many :comments
  belongs_to :user
  has_many :ingredients
  has_many :directions
  has_many :recipe_ingredients
end
