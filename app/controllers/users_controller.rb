class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show

  def show
    @user = User.find(params[:id])
    @meals = @user.meals
    redirect_to root_path if @user.id != current_user.id
    favorites = Favorite.where(user_id: current_user.id).order('created_at DESC').pluck(:meal_id)
    @favorites = Meal.find(favorites)
  end
end
