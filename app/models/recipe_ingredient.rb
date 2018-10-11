class RecipeIngredient < ApplicationRecord
  belongs_to :ingredient
  belongs_to :recipe, counter_cache: true

  accepts_nested_attributes_for :ingredient, :reject_if => :all_blank, :allow_destroy => true

  def ingredient_name
    self.ingredient.name if !self.id.nil?
  end

  def ingredient_name=(name)
    @ingredient = Ingredient.find_or_create_by(name: name)
    self.ingredient = @ingredient
  end

  def recipe_line_detail
    "#{clean_number(self.quantity.to_f)} #{self.unit.pluralize(self.quantity.to_f)} #{self.ingredient.name}"
  end

  # only shows decimal if needed, otherwise integer
  def clean_number(num)
    "%.3g" % ("%.2f" % num)
  end

end
