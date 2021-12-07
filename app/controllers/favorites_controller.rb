class FavoritesController < ApplicationController
  before_action :set_meal

  def create
    @favorite = Favorite.create(user_id: current_user.id, meal_id: @meal.id) if @meal.user_id != current_user.id
  end

  def destroy
    if @meal.user_id != current_user.id
      @favorite = Favorite.find_by(user_id: current_user.id, meal_id: @meal.id)
      @favorite.destroy
    end
  end

  private

  def set_meal
    @meal = Meal.find(params[:meal_id])
  end
end
