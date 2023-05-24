require "test_helper"

class MessageTest < ActiveSupport::TestCase
  test "No deberia guardarse sin id_chat" do
    @message = messages(:mes_2)
    result = @message.save
    assert_not result, "Mensaje guardado sin id_chat"
  end

  test "No deberia guardarse sin content" do
    @message = messages(:mes_1)
    result = @message.save
    assert_not result, "Mensaje guardado sin content"
  end

  test "No deberia guardarse sin id_user" do
    @message = messages(:mes_4)
    result = @message.save
    assert_not result, "Mensaje guardado sin id_user"
  end

  teardown do
    Rails.cache.clear
  end
end
