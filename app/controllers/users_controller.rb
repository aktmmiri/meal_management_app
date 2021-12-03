class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show

  def show
    @user = User.find(params[:id])
    @meals = @user.meals
    if @user.id != current_user.id
      redirect_to root_path 
    end
    favorites = Favorite.where(user_id: current_user.id).order('created_at DESC').pluck(:meal_id)
    @favorites = Meal.find(favorites)
  end
end
