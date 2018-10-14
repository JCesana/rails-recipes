class UsersController < ApplicationController
  def index
    @users = User.all.order("email ASC")
  end

  def top_contributors
    @users = User.top_contributors
  end
end
