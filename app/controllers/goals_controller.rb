class GoalsController < ApplicationController
  before_action :herd_user

  def create

    @goal = current_user.goals.new(goal_params)
    if @goal.save
      redirect_to :back
    else
      flash[:goal] = goal_params
      flash[:errors] = @goal.errors.full_messages
      redirect_to :back
    end
  end

  def index
  end

  def show
  end


  private

  def goal_params
    params.require(:goal).permit(:title, :body, :visible, :target_date)
  end
end
