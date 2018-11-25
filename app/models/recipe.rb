class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_ingredients, inverse_of: :recipe, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients
  has_many :directions, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :image, dependent: :destroy

  accepts_nested_attributes_for :directions, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :recipe_ingredients, :reject_if => :all_blank, :allow_destroy => true

  validates :title, :description, :recipe_ingredients, :directions, :image, presence: true

  scope :by_ingredient, -> (ingredient) { joins(:ingredients).where("ingredients.name = ?", ingredient) }

  scope :active, -> { order("comments_count DESC") }

  scope :most_ingredients, -> { order("recipe_ingredients_count DESC") }

  scope :least_ingredients, -> { order("recipe_ingredients_count ASC") }

  def next
    if next_recipe = self.class.order("title ASC").where("title > ?", title).first
      next_recipe
    else
      self.class.order("title ASC").first
    end
  end

  def previous
    if previous_recipe = self.class.order("title DESC").where("title < ?", title).first 
      previous_recipe
    else
      self.class.order("title DESC").first
    end
  end
end
