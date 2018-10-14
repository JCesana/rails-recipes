class CommentsController < ApplicationController
  before_action :set_recipe
  before_action :authenticate_user!

  def create
    @comment = @recipe.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
  end

  def index
    if params[:recipe_id]
      @recipe = Recipe.find_by(id: params[:recipe_id])
      @comments = @recipe.comments
      render :index
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
