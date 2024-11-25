require "application_system_test_case"

class CartsTest < ApplicationSystemTestCase
  setup do
    @cart = carts(:one)
  end

  test "visiting the index" do
    visit carts_url
    assert_selector "h1", text: "Carts"
  end

  test "should create cart" do
    visit carts_url
    click_on "New cart"

    click_on "Create Cart"

    assert_text "Cart was successfully created"
  end

  test "should update Cart" do
    visit cart_url(@cart)
    click_on "Edit this cart", match: :first

    click_on "Update Cart"

    assert_text "Cart was successfully updated"
  end

  test "should destroy Cart" do
    visit store_index_url
    click_on "Add to Cart", match: :first

    visit cart_url(Cart.last)
    click_on "Destroy this cart", match: :first

    assert_text "Cart was successfully destroyed"
  end
end
