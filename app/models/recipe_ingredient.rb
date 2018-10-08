class RecipeIngredient < ApplicationRecord
  belongs_to :ingredient
  belongs_to :recipe

  validates_uniqueness_of :recipe_id, :scope => :ingredient_id

  def ingredient_attributes=(ingredient_attributes)
    ingredient_attributes.values.each do |attribute|
      if attribute != ""
        ingredient = Ingredient.find_or_create_by(name: attribute)
        self.ingredient = ingredient
      end
    end
  end

  def recipe_line_detail
    "#{clean_number(self.quantity.to_f)} #{self.unit.pluralize(self.quantity.to_f)} #{self.ingredient.name}"
  end

  # only shows decimal if needed, otherwise integer
  def clean_number(num)
    "%.3g" % ("%.2f" % num)
  end

end
