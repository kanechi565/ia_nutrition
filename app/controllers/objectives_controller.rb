class ObjectivesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_objective, only: [:show]
  def index
    @objectives = current_user.objectives
  end

  def new
    @objective = Objective.new
  end

  def create
    @objective = Objective.new(objective_params)
    if @objective.save!
      redirect_to objective_path(@objective), notice: "Objectif crée"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  private

  def objective_params
    params.require(:objective).permit(:name, :description)
  end

  def set_objective
    @objective = Objective.find(params[:id])
  end
end
