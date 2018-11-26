class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :user, :created_at

  belongs_to :recipe
  belongs_to :user
end
