require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "Product attribute can not be empty" do
    product = Product.new
    assert product.invalid?
    # puts product.errors.inspect
    puts product.errors.full_messages
    assert product.errors[:title].any?
    assert product.errors[:price].any?
    assert product.errors[:description].any?
    assert product.errors[:image_url].any?
  end

  test "negative price validation" do
  	product = Product.new
  	product.price = -1
  	assert product.invalid?
  	assert product.errors[:price].any?
  	puts product.errors[:price]
  	assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]
  end

  test "positive price validation" do
  	product = Product.new(title: "Validation Test1", description: "price validation", image_url: "zzz.jpg")
  	product.price = 1 
  	assert product.valid?
  	# puts product.errors.to_json
  	
  end

  test "mininum value" do
      product = Product.new(title: "Validation Test1", description: "price validation", image_url: "zzz.jpg")
      assert product.invalid?
      assert product.errors[:title].any?
      assert_equal ['is too short (minimum is 10 characters)'], @product.errors[:title]
  end

  test "product validation" do
  	product = Product.new(title: "Validation Test", description: "price validation", image_url: "zzz.jpg", price: 1)
  	assert product.invalid?
  	puts product.errors[:title]
  	assert product.errors[:title].any?
  	assert_equal ["has already been taken"], product.errors[:title]
  end

  # test "product title must be unique" do
  # 	product = Product.new(title: "Validation Test", description: "price validation", image_url: "zzz.jpg", price: 1)
  # 	product.save
  # 	assert product.valid?
  # end

  # test "product title must be unique 1" do
  # 	product = Product.new(title: "Validation Test", description: "price validation", image_url: "zzz.jpg", price: 1)
  # 	product.save
  # 	assert product.valid?
  # end

  # test "product title must be unique 2" do
  # 	product = Product.new(title: "Validation Test", description: "price validation", image_url: "zzz.jpg", price: 1)
  # 	assert product.invalid?
  # 	assert.product.errors[:title].any?
  # end
end
