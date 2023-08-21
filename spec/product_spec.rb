require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @category = Category.new(name: 'cacti')
    @category.save
  end

  describe 'Validations' do

    it 'ensures that a product with all fields set will save successfully' do
      @product = Product.new(name: 'blue fern', price: 100, quantity: 3, category: @category)
      expect(@product).to be_valid
    end

    it 'fails to save when no name is set' do
      @product = Product.new(name: nil, price: 100, quantity: 3, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Name cannot be blank")
      expect(@product).to_not be_valid
    end

    it 'fails to save when no price is set' do
      @product = Product.new(name: 'blue fern', quantity: 3, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Price cannot be blank")
      expect(@product).to_not be_valid
    end

    it 'fails to save when no quantity is set' do
      @product = Product.new(name: 'blue fern', price: 100, quantity: nil, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Quantity cannot be blank")
      expect(@product).to_not be_valid
    end

    it 'fails to save when no category is set' do
      @product = Product.new(name: 'blue fern', price: 100, quantity: 3, category: nil)
      @product.save
      expect(@product.errors.full_messages).to include("Category cannot be blank")
      expect(@product).to_not be_valid
    end
  end

end