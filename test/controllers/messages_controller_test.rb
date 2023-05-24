require "test_helper"

class MessagesControllerTest < ActionDispatch::IntegrationTest
  test "Deberia crear message" do
    assert_difference("Message.count") do
      post messages_url, params: { message: { name: "Prueba: ", content: "Este es un mensaje de prueba", id_chat: 1 } }
    end
    assert_redirected_to chat_url(Message.last.id_chat)
  end

  teardown do
    Rails.cache.clear
  end
end
