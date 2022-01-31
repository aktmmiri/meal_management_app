class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    comment = Comment.new(comment_params)
    if comment.save
      redirect_to meal_path(comment.meal.id)
    else
      render "meals/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, meal_id: params[:meal_id])
  end
end
