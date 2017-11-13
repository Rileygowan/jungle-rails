require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should save with when all fields are set' do
      @category = Category.new(
          name: 'cheese'
        )

      @product = @category.products.new(
          name: 'Havarti',
          price: 500,
          quantity: 5
        )
      expect(@product).to be_valid
    end
    it 'should not save when name is set to nil' do
      @category = Category.new(
          name: 'Ham'
        )

      @product = @category.products.new(
          name: nil,
          price: 300,
          quantity: 7
        )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")

    end
    it 'should not save when price is set to nil' do
      @category = Category.new(
          name: 'Lettuce'
        )

      @product = @category.products.new(
          name: 'Boston',
          price: nil,
          quantity: 300
        )
      expect(@product).to_not be_valid
    end
    it 'should not save when quantity is set to nil' do
      @category = Category.new(
          name: 'Dressing'
        )

      @product = @category.products.new(
          name: '1000 Island',
          price: 450,
          quantity: nil
        )
    end
    it 'should not save when the category is set to nil' do
      @product = Product.new(
          name: 'Pineapple',
          price: 120,
          quantity: 6
        )
      expect(@product).to_not be_valid
    end
  end
end
