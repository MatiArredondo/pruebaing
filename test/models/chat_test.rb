require "test_helper"

class ChatTest < ActiveSupport::TestCase
  test "No deberia guardarse sin id_user" do
    @chat = chats(:chat_1)
    result = @chat.save
    assert_not result, "Chat guardado sin id_user"
  end

  test "No deberia guardarse sin moderator_id" do
    @chat = chats(:chat_3)
    result = @chat.save
    assert_not result, "Chat guardado sin moderator_id"
  end

  teardown do
    Rails.cache.clear
  end
end
