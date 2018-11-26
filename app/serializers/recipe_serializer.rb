class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :comments, :ingredients, :directions 

  has_many :comments
  belongs_to :user
  has_many :ingredients
  has_many :directions
end
