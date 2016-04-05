class GoalsController < ApplicationController
  def create
    
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def goal_params
    params.require(:goal).permit(:title, :privacy)
  end
end
