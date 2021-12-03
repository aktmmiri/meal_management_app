class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show

  def show
    @user = User.find(params[:id])
    @meals = @user.meals
    if @user.id != current_user.id
      redirect_to root_path 
    end
  end
end
