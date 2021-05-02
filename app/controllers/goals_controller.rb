class GoalsController < ApplicationController
  before_action :set_goal, only: %i(show update destroy)

  def index
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)

    if @goal.save
      redirect_to money_index_path
    else 
      render :new
    end
  end

  def show
  end

  def update
    if @goal.update(goal_params)
      redirect_to money_index_path
    else
      render :show
    end
  end

  def destroy
    @goal.destroy
    redirect_to money_index_path
  end

  private
  def set_goal
    @goal = Goal.find(params[:id])
  end

  def goal_params
    params.require(:goal).permit(:weight_goal, :saving_goal, :purpose, :period).merge(user_id: current_user.id)
  end
end
