class MealsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :set_meal, only: [:show, :edit, :update]

  def index
    @meals = Meal.includes(:user).order('created_at DESC')
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

  def show
  end

  def edit
  end

  def update
    if @meal.update(meal_params)
      redirect_to meal_path(@meal.id)
    else
      render :edit
    end
  end

  private

  def set_meal
    @meal = Meal.find(params[:id])
  end

  def meal_params
    params.require(:meal).permit(:name, :image, :info, :amount, :calorie, :meal_time_id).merge(user_id: current_user.id)
  end
end
