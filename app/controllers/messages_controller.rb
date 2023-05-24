class MessagesController < ApplicationController
  def create
    content = message_params[:name] + message_params[:content]
    @message = Message.new(content: content, id_chat: message_params[:id_chat], id_user: message_params[:id_user])
    if @message.save
      redirect_to chat_path(@message.id_chat)
    else
      render @chat.errors, status: :unprocessable_entity
    end
  end

  def message_params
    params.require(:message).permit(:name, :content, :id_chat, :id_user)
  end
end

