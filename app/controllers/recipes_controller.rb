class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :image_present?, only: [:create]

  def index
    @recipes = Recipe.all.order("created_at DESC")
  end

  def active
    @recipes = Recipe.active
    render action: :index
  end

  def hardest
    @recipes = Recipe.most_ingredients
    render action: :index
  end

  def easiest
    @recipes = Recipe.least_ingredients
    render action: :index
  end

  def show
    @comment = Comment.new
    @comments = @recipe.comments.order("created_at DESC")
  end

  def new
    @recipe = Recipe.new
    @recipe.recipe_ingredients.build.build_ingredient
    @recipe.directions.build
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    if @recipe.save
      flash[:primary] = "Successfully created new recipe"
      redirect_to @recipe
    else
      flash.now[:danger] = @recipe.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      flash.now[:danger] = @recipe.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    @recipe.destroy
    flash.now[:primary] = "Successfully deleted recipe"
    redirect_to root_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :description, :image,
      recipe_ingredients_attributes: [:id, :quantity, :unit, :ingredient_name, :_destroy],
      directions_attributes: [:id, :step, :_destroy])
  end

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

  def image_present?
    if recipe_params[:image].nil?
      flash[:danger] = "Please upload an image with your recipe."
      @recipe = Recipe.new(recipe_params) #repopulate fields
      render :new
    end
  end

end
