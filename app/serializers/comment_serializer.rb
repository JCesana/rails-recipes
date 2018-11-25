class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body

  belongs_to :recipe 
end
