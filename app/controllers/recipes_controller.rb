class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @recipes = Recipe.all.order("created_at DESC")
  end

  def show
    @comment = Comment.new
    @comments = @recipe.comments.order("created_at DESC")
  end

  def new
    @recipe = current_user.recipes.build
    @recipe.ingredients.build
    @recipe.directions.build
  end

  def create
    @recipe = current_user.recipes.build(title: recipe_params[:title])
    @recipe.description = recipe_params[:description]

    recipe_params[:ingredients_attributes].each do |key, value|
      @recipe.ingredients << Ingredient.find_or_initialize_by(name: value[:name])
    end

    recipe_params[:directions_attributes].each do |key, value|
      @recipe.directions << Direction.new(step: value[:step])
    end

    @recipe.image.attach(recipe_params[:image])
    
    clean_up_recipe

    if @recipe.save
      redirect_to @recipe, notice: "Successfully created new recipe"
    else
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
    params.require(:recipe).permit(:title, :description, :image, ingredients_attributes: [:id, :name, :_destroy], directions_attributes: [:step, :_destroy])
  end

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

  def clean_up_recipe
    @recipe.title.strip!
    @recipe.description.strip!

    @recipe.ingredients.each do |ingredient|
      ingredient.name.downcase!.strip!
    end

    @recipe.directions.each do |direction|
      direction.step.strip!
    end
  end

end
