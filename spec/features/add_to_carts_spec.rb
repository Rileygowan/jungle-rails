require 'rails_helper'

RSpec.feature "Visitor can add a product to the cart", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see the items in the cart" do
    visit root_path
    add_to_cart = page.find_link('Add', match: :first)
    add_to_cart.click


    expect(page).to have_content('My Cart (1)')
    # save_screenshot
  end




end
