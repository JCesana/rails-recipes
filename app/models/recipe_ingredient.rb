class RecipeIngredient < ApplicationRecord
  belongs_to :ingredient
  belongs_to :recipe

  # Do I need this??
  # accepts_nested_attributes_for :ingredient, :reject_if => :all_blank

  validates_uniqueness_of :recipe_id, :scope => :ingredient_id

  def recipe_line_detail
    "#{pluralize(clean_number(ri.ingredient_quantity), ri.ingredient_unit)} #{ri.ingredient_name}"
  end

  # only shows decimal if needed, otherwise integer
  def clean_number(num)
    "%.3g" % ("%.2f" % num)
  end

  def ingredient_name
    ingredient = Ingredient.find_by(id: self.ingredient_id)
    ingredient.name
  end

  def ingredient_quantity
    self.quantity.to_f
  end

  def ingredient_unit
    self.unit
  end
end
