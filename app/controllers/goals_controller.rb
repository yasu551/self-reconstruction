class GoalsController < ApplicationController
  before_action :set_goal, only: %i[ show edit update destroy ]

  # GET /goals
  def index
    @goals = current_user.goals.default_order
  end

  # GET /goals/1
  def show
  end

  # GET /goals/new
  def new
    @goal = current_user.goals.build
  end

  # GET /goals/1/edit
  def edit
  end

  # POST /goals
  def create
    @goal = current_user.goals.build(goal_params)

    if @goal.save
      redirect_to @goal, notice: "Goal was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /goals/1
  def update
    if @goal.update(goal_params)
      redirect_to @goal, notice: "Goal was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /goals/1
  def destroy
    @goal.destroy!
    redirect_to goals_path, notice: "Goal was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal
      @goal = Goal.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def goal_params
      params.expect(goal: [ :content, :memo, :enabled ])
    end
end
