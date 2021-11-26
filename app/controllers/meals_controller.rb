class MealsController < ApplicationController
  def index
  end

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.new(meal_params)
    if @meal.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def meal_params
    params.require(:meal).permit(:name, :image, :info, :amount, :calorie, :time_id).merge(user_id: current_user.id)
  end
end
