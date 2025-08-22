class ChatsController < ApplicationController
  def create
    @chat = Chat.new(name: "Pas de titre")
    @objective = Objective.find(params[:objective_id])
    @chat.objective = @objective
    if @chat.save!
      redirect_to chat_path(@chat)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @chat = Chat.find(params[:id])
    @new_chat = Chat.new
    @message = Message.new
    @objective = @chat.objective
    @chats = @objective.chats
  end

  def destroy
    @chat = Chat.find(params[:id])
    @objective = @chat.objective
    @chat.destroy
    @chatredirect = @objective.chats.last
    redirect_to chat_path(@chatredirect)
  end
  private

  def chat_params
    params.require(:chat).permit(:name, :messages)
  end

end
