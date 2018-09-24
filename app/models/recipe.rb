class Recipe < ApplicationRecord

  has_many :ingredients
  has_many :directions

  accepts_nested_attributes_for :ingredients,
                                reject_if: proc { |attributes| attributes['name'].blank? },
                                allow_destroy: true
  accepts_nested_attributes_for :directions,
                                reject_if: proc { |attributes| attributes['step'].blank? },
                                allow_destroy: true

  validates :title, :description, :image, presence: true 

  has_one_attached :image

  def medium
    return self.image.variant(resize: '400x400')
  end

  def thumbnail
    return self.image.variant(resize: '200x200')
  end
end
