require "rails_helper"

RSpec.feature "Users can view categories" do

  scenario "with the category details" do
    category = FactoryGirl.create(:category, title: "Smartphones", description: "Best smartphones for you")

    visit '/'
    click_link 'Categories'
    click_link "Smartphones"
    expect(page.current_url).to eq category_url(category)
  end

end
