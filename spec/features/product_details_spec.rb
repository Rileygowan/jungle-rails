require 'rails_helper'

RSpec.feature "Visitor navigates to product details", type: :feature, js: true do

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

  scenario "They can navigate to product details from homepage" do
    visit root_path
    link = page.find_link('Details', match: :first)
    link.click

    expect(page).to have_css 'article.product-detail'
    save_screenshot
  end

end