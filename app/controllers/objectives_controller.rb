class ObjectivesController < ApplicationController
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
private

  def objective_params
    params.require(:objective).permit(:name, :description)
  end
end
