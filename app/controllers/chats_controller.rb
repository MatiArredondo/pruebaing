class ChatsController < ApplicationController
  def index
    @chat = Chat.all
  end

  def new
    @users = User.all
    @chat = Chat.new
  end

  def show
    @chat = Chat.find(params[:id])
    all_messages = Message.all
    messages_chat = Array.new
    all_messages.each do |message|
      if message.id_chat == @chat.id
        messages_chat.push(message)
      end
    end
    @messages = messages_chat
  end

  def create
    all_chats = Chat.all
    is_any = false
    all_chats.each do |chat|
      if chat.id_user == chat_params[:id_user].to_i && chat.moderator_id == chat_params[:moderator_id].to_i
        is_any = true
      end
    end
    if is_any == false
      @chat = Chat.new(chat_params)
      if @chat.save
        redirect_to @chat
      else
        render @chat.errors, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @chat = Chat.find(params[:id])
    @messages = Message.all

    @messages.each do |message|
      if message.id_chat == @chat.id
        message.destroy
      end
    end

    if @chat.destroy
      redirect_to chats_path
    else
      render json: @chat.errors, status: :unprocessable_entity
    end
  end

  def chat_params
    params.require(:chat).permit(:moderator_id, :id_user)
  end
end
