class GoalsController < ApplicationController
  def index
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)

    if @goal.save
      redirect_to root_path
    else 
      render :new
    end
  end

  def show
  end

  private
  def goal_params
    params.require(:goal).permit(:weight_goal, :saving_goal, :purpose, :period).merge(user_id: current_user.id)
  end
end
