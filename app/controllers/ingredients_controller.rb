class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.order("name ASC")
  end

  def show
    ingredient = Ingredient.find_by_id(params[:id])
    @recipes = Recipe.joins(:ingredients).where("ingredients.id = ? ", ingredient)
    flash.now[:primary] = "Showing all recipes containing #{ingredient.name}."
    render 'recipes/index'
  end
end
