class RecipeIngredient < ApplicationRecord
  belongs_to :ingredient
  belongs_to :recipe

  # Do I need this??
  # accepts_nested_attributes_for :ingredient, :reject_if => :all_blank

  validates_uniqueness_of :recipe_id, :scope => :ingredient_id

  def recipe_line_detail
    "#{clean_number(self.quantity.to_f)} #{self.unit.pluralize(self.quantity.to_f)} #{self.ingredient.name}"
  end

  # only shows decimal if needed, otherwise integer
  def clean_number(num)
    "%.3g" % ("%.2f" % num)
  end

end
