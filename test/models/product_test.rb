require 'test_helper'

class ProductTest < ActiveSupport::TestCase
	fixtures :products
	test "Свойства товара не должны быть пустыми" do
  		product = Product.new
  		assert product.invalid?
  		assert product.errors[:title].any?
  		assert product.errors[:description].any?
  		assert product.errors[:price].any?
  		assert product.errors[:image_url].any?
	end
	 
	def new_product(image_url)
		Product.new(title: "My book title",
					description: "yyy",
					price: 1,
					image_url: image_url)
	end
	test "image_url" do
		ok = %w{ fred.gif fred.jpg red.png FRED.jpg FRED.Jpg http://a.b.c/x/y/z/fred.gif }
		bad = %w{ fred.doc fred.gif/more fred.gif.more }

		ok.each do |name|
			assert new_product(name).valid?, "#{name} shouldn't be invalid"
		end
		bad.each do |name|
			assert new_product(name).invalid?, "#{name} shouldn't be valid"
		end
	end
	test " Товар некорректен без уникального заголовка" do
		product = Product.new(title: products(:ruby).title,
			description: "yyy",
			price: 1,
			image_url: "fred.gif")

		assert product.invalid?

		assert_equal ["has already been taken"], product.errors[:title]
	end
end
