class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :title, :description

  has_many :comments
  belongs_to :user 
end
