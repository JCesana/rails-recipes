class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :current_user

  has_many :comments
  has_many :recipes
end
