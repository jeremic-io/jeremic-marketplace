require "rails_helper"

RSpec.feature "Users can create categories" do

  scenario "with valid attributes" do
    visit "/categories"

    click_link "New Category"

    fill_in "Title", with: "Cars"
    fill_in "Description", with: "Simple descriptions"
    click_button "Create Category"

    expect(page).to have_content "Category has been created."

    category = Category.find_by(title: "Cars")
    expect(page.current_url).to eq category_url(category)
    title = "Cars - Categories - Jeremic Marketplace"
    expect(page).to have_title title
  end

end
