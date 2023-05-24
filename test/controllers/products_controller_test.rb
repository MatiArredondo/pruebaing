require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "Deberia mostrar index" do
    get products_url
    assert_response :success
  end

  test "Deberia conseguir new" do
    get new_product_url
    assert_response :success
  end

  test "Deberia crear product" do
    assert_difference("Product.count") do
      post products_url, params: { product: { name: "Esto es un producto de Prueba", price: 14990, image: "HTTP#33324" } }
    end
    assert_redirected_to product_url(Product.last)
  end

  test "Deberia mostrar product" do
    @product = products(:prod_4)
    get product_url(@product)
    assert_response :success
  end

  test "Deberia conseguir edit" do
    @product = products(:prod_4)
    get edit_product_url(@product)
    assert_response :success
  end

  test "Deberia actualizar product" do
    @product = products(:prod_4)
    patch product_url(@product), params: { product: { name: "Actualizacion de Prueba" , price: 9990, image: "HTTP#333242" } }
    assert_redirected_to product_url(@product)
  end

  test "Deberia destruir product" do
    @product = products(:prod_4)
    assert_difference("Product.count", -1) do
      delete product_url(@product)
    end
    assert_redirected_to products_url
  end

  teardown do
    Rails.cache.clear
  end
end
