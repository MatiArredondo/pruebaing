require "test_helper"

class ChatsControllerTest < ActionDispatch::IntegrationTest
  test "Deberia mostrar index" do
    get chats_url
    assert_response :success
  end

  test "Deberia mostrar new" do
    get new_chat_url
    assert_response :success
  end

  test "Deberia crear chat" do
    assert_difference("Chat.count") do
      post chats_url, params: { chat: { id_user: 1 } }
    end
    assert_redirected_to chat_url(Chat.last)
  end

  test "Deberia mostrar chat" do
    @chat = chats(:chat_2)
    get chat_url(@chat)
    assert_response :success
  end

  test "Deberia destruir chat" do
    @chat = chats(:chat_2)
    assert_difference("Chat.count", -1) do
      delete chat_url(@chat)
    end
    assert_redirected_to chats_url
  end

  teardown do
    Rails.cache.clear
  end
end
