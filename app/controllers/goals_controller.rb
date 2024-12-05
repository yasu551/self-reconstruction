class GoalsController < ApplicationController
  def index
    @goals = current_user.goals.default_order
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end
end
