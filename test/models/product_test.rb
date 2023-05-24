require "test_helper"

class ProductTest < ActiveSupport::TestCase
  test "No deberia guardarse sin name" do
    @product = products(:prod_3)
    result = @product.save
    assert_not result, "Producto guardado sin name"
  end

  test "No deberia guardarse sin price" do
    @product = products(:prod_2)
    result = @product.save
    assert_not result, "Producto guardado sin price"
  end

  test "No deberia guardarse sin image" do
    @product = products(:prod_1)
    result = @product.save
    assert_not result, "Producto guardado sin image"
  end

  test "No deberia guardarse sin id_user" do
    @product = products(:prod_5)
    result = @product.save
    assert_not result, "Producto guardado sin id_user"
  end

  teardown do
    Rails.cache.clear
  end
end
