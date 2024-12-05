class GoalsController < ApplicationController
  def index
    @goals = current_user.goals.default_order
  end

  def new
    @goal = current_user.goals.build
  end

  def create
    @goal = current_user.goals.build(goal_params)
    if @goal.save
      redirect_to goals_path, notice: t('controllers.created')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  private

  def goal_params
    params.expect(goal: %i[content memo enabled])
  end
end
