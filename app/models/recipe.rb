class Recipe < ApplicationRecord
  has_one_attached :image

  def medium
    return self.image.variant(resize: '400x400')
  end

  def thumbnail
    return self.image.variant(resize: '200x200')
  end
end
