class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @meals = @user.meals
  end
end
