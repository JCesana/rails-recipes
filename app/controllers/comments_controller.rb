class CommentsController < ApplicationController
  before_action :set_recipe, except: [:user_comments]
  before_action :authenticate_user!

  def create
    @comment = @recipe.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      render json: @comment, status: 201
    else
      flash[:danger] = @comment.errors.full_messages
      render json: { errors: @comment.errors.full_messages }, status: 400
    end
  end

  def index
    if params[:recipe_id]
      @recipe = Recipe.find_by(id: params[:recipe_id])
      @comments = @recipe.comments
      render :index
    end
  end

  def user_comments
    if params[:user_id]
      @user = User.find_by_id(params[:user_id])

      @comments = @user.comments.all
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :recipe_id)
  end

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end
end
