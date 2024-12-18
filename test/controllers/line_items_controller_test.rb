require "test_helper"

class LineItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @line_item = line_items(:one)
    @product = products(:ruby) # assuming a fixture named 'ruby' exists in products.yml
  end

  test "should get index" do
    get line_items_url
    assert_response :success
  end

  test "should get new" do
    get new_line_item_url
    assert_response :success
  end

  test "should create line_item" do
    assert_difference("LineItem.count") do
      post line_items_url, params: { product_id: @product.id }
    end

    follow_redirect!
<<<<<<< HEAD
<<<<<<< HEAD
    assert_select 'h2', 'Your Cart'  # Updated to match the actual text in your view
    assert_select 'li', "1 \u00D7 Programming Ruby 1.9"  # Ensure this matches your product title
=======
    assert_select 'h2', 'Your Pragmatic Cart'
    assert_select 'li', @product.title
>>>>>>> parent of 15ac0d3 (wokring throuhg E1)
=======
    assert_select 'h2', 'Your Pragmatic Cart'
    assert_select 'li', "1 \u00D7 Programming Ruby 1.9"
>>>>>>> parent of a339a0a (E3 complete)
  end

  test "should show line_item" do
    get line_item_url(@line_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_line_item_url(@line_item)
    assert_response :success
  end

  test "should update line_item" do
    patch line_item_url(@line_item), params: { line_item: { cart_id: @line_item.cart_id, product_id: @line_item.product_id } }
    assert_redirected_to line_item_url(@line_item)
  end

  test "should destroy line_item" do
    assert_difference("LineItem.count", -1) do
      delete line_item_url(@line_item)
    end

    assert_redirected_to line_items_url
  end
end

