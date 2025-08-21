class ChatsController < ApplicationController
  def new
    # On passe à l'IA l'objectif actuel, et on lui dit d'être un pro dans ce domaine.
    # Dans ce chat on pourra échanger des messages avec lui
    @chat = Chat.new
    @objective = Objective.find(params[:objective_id])
  end

  def create
    @chat = Chat.new(name: "Pas de titre")
    @objective = Objective.find(params[:objective_id])
    @chat.objective = @objective
    if @chat.save!
      redirect_to chat_path(@chat), notice: "let's go to chat ;)"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @chat = Chat.find(params[:id])
    @message = Message.new
  end
end
