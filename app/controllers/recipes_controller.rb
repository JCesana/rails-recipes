class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show, :edit, :update, :destroy, :next, :previous]
  before_action :authenticate_user!, except: [:index, :show, :previous, :next]
  before_action :image_present?, only: [:create]
  before_action :authorize_user, only: [:edit, :update, :destroy]

  def index
    if params[:user_id]
      @user = User.find_by_id(params[:user_id])
      @recipes = @user.recipes

      respond_to do |format|
        format.html { render :index }
        format.json { render json: @recipes }
      end
    else
      @recipes = Recipe.all.order("created_at DESC")
    end
  end

  def next
    @next_recipe = @recipe.next
    @comment = Comment.new

    render json: @next_recipe
  end

  def previous
    @previous_recipe = @recipe.previous
    @comment = Comment.new

    render json: @previous_recipe
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
    @comments = @recipe.comments.order("created_at ASC")

    respond_to do |format|
      format.html { render :show }
      format.json { render json: @recipe.to_json(only: [:id, :description] ) } # to append description on index
    end
  end

  def new
    if params[:user_id]
      user = User.find_by_id(params[:user_id])

      if user != current_user
        flash[:danger] = "You do not have permission to do this."
        redirect_to root_path
      end
    end

    @recipe = Recipe.new
    @recipe.recipe_ingredients.build.build_ingredient
    @recipe.directions.build
  end

  def edit
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


  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      flash.now[:danger] = @recipe.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    if @recipe.destroy
      flash.now[:primary] = "Successfully deleted recipe"
      redirect_to root_path
    else
      flash.now[:danger] = @recipe.errors.full_messages
      render 'show'
    end

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

  def authorize_user
    if !(current_user == @recipe.user || current_user.admin) # NOT AUTHORIZED TO EDIT, UPDATE, DESTROY
      flash[:danger] = "You do not have permission to do this."
      redirect_to root_path
    end
  end

end
