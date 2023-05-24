class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])

    if current_user.admin?

      @chats = Chat.all

      @chats.each do |chat|
        if chat.id_user == @user.id
          chat.destroy
        end
      end

      if current_user.id == @user.id
        @user.destroy
        redirect_to "/"

      else
        @user.destroy
        redirect_to users_path, notice: "Usuario eliminado correctamente"

      end
    end
  end
end
