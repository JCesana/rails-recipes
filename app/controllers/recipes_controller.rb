class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :image_present?, only: [:create]

  def index
    @recipes = Recipe.all.order("created_at DESC")
  end

  def show
    @comment = Comment.new
    @comments = @recipe.comments.order("created_at DESC")
  end

  def new
    @recipe = current_user.recipes.new
    @recipe.recipe_ingredients.build.build_ingredient
    @recipe.directions.build
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user

    if @recipe.save
      redirect_to @recipe, notice: "Successfully created new recipe"
    else
      flash[:alert] = @recipe.errors.full_messages
      render 'new'
    end
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render 'edit'
    end
  end

  def destroy
    @recipe.destroy
    redirect_to root_path, notice: "Successfully deleted recipe"
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :description, :image,
      recipe_ingredients_attributes: [:id, :quantity, :unit, :_destroy, ingredient_attributes: [:id, :name, :_destroy] ],
      directions_attributes: [:id, :step, :_destroy])
  end

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

  def image_present?
    if recipe_params[:image].nil?
      redirect_to new_recipe_path, alert: "Please upload an image with your recipe."
    end
  end

end
