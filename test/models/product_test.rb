require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # Test for the presence of attributes
  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end

  # Test for uniqueness of title
  test "product is not valid without a unique title" do
    product = Product.new(
      title: products(:ruby).title, # Assuming products(:ruby) is defined in your fixtures
      description: "yyy",
      price: 1,
      image_url: "fred.gif"
    )
    assert product.invalid?
    assert_equal ["has already been taken"], product.errors[:title]
  end

  # Test for price must be a number
  test "product price must be a number" do
    product = Product.new(
      title: "Valid Title",
      description: "yyy",
      price: "not_a_number",
      image_url: "fred.gif"
    )
    assert product.invalid?
    assert_equal ["is not a number"], product.errors[:price]
  end

  # Test for price must be greater than or equal to 0.01
  test "product price must be at least 0.01" do
    product = Product.new(
      title: "Valid Title",
      description: "yyy",
      price: 0,
      image_url: "fred.gif"
    )
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]
  end

  # Test for image_url format
  test "product image_url must be valid format" do
    product = Product.new(
      title: "Valid Title",
      description: "yyy",
      price: 1,
      image_url: "invalid_format"
    )
    assert product.invalid?
    assert_equal ["is invalid"], product.errors[:image_url]
  end

  # Test for valid product creation
  test "product is valid with valid attributes" do
    product = Product.new(
      title: "Unique Title",
      description: "Valid description",
      price: 1,
      image_url: "valid_image.gif"
    )
    assert product.valid?
  end
end

