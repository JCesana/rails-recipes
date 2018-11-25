class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :recipe, counter_cache: true
  validates :body, presence: true, allow_blank: false

  def user_name
    self.user.name 
  end
end
