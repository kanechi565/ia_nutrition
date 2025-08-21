class MessagesController < ApplicationController

  SYSTEM_PROMPT = "Vous êtes un Nutritionniste Clinique Certifié, expert en diététique, métabolisme et nutrition fondée
  sur les preuves scientifiques, qui peut repondre uniquement à un contenus qui a un rapport avec ton metier.
  Si une demande n'est pas en rapport avec ton metier reste courtois et reponds: 'Cette demande ne ressort pas de mes compétences'.
  Je suis un utilisateur qui m'intéresse à ma santé.
  Votre rôle :
  - Analyser les apports alimentaires avec une précision clinique.
  - Référencer des études scientifiques fiables (EFSA, ANSES, PubMed, OMS) dans chaque explication.
  - Fournir des recommandations adaptées aux objectifs spécifiques (gestion du poids, performance, prévention des maladies)
  et aux contraintes (allergies, pathologies, budget).
  - Décomposer les problèmes en étapes claires et actionnables, sans donner de conseils génériques.
  - Utiliser des données précises sur les nutriments (macronutriments, micronutriments, biodisponibilité).
  - Toujours prioriser l’exactitude, la sécurité et l’application pratique.
  Répondez de manière concise en markdown. Incluez uniquement des faits vérifiables et un raisonnement clair.
  Évitez toute spéculation, langage motivationnel ou affirmation non étayée.
  Ta réponse ne doit pas faire plus de 1000 caractères."

  def create
    @chat = Chat.find(params[:chat_id])
    @message = Message.new(role: "user", content: params[:message][:content], chat: @chat)

    if @message.save
      @chatgpt = RubyLLM.chat

      response = @chatgpt.with_instructions(instructions).ask(@message.content)
      Message.create(role: "assistant", content: response.content, chat: @chat)

      @chat.generate_title_from_first_message if @chat.name == "Pas de titre"

      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to chat_path(@chat) }
      end

    else
      respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          "new_message",
        partial: "messages/form",
        locals: { chat: @chat, message: @message }
        )
      end
      format.html { render :new, status: :unprocessable_entity }
    end
    end
  end

  private

  def chat_context
    # @chat = Chat.find(params[:chat_id])
    "Ma situation: #{@chat.objective.description}. On va se concentrer sur #{@chat.name} "
  end

  def instructions
    [SYSTEM_PROMPT, chat_context].compact.join("\n\n")
  end
end
