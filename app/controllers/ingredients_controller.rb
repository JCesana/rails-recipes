class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.order("name ASC")
  end 
end
