require "rails_helper"

RSpec.feature "Users can create categories" do

  before do
    visit '/categories'

    click_link 'New Category'
  end

  scenario "with valid attributes" do
    fill_in "Title", with: "Cars"
    fill_in "Description", with: "Simple descriptions"
    click_button "Create Category"

    expect(page).to have_content "Category has been created."

    category = Category.find_by(title: "Cars")
    expect(page.current_url).to eq category_url(category)
    title = "Cars - Categories - Jeremic Marketplace"
    expect(page).to have_title title
  end

  scenario "when providing invalid attributes" do

    click_button 'Create Category'

    expect(page).to have_content 'Category has not been created.'
    expect(page).to have_content 'Title can\'t be blank'
    expect(page).to have_content 'Description can\'t be blank'
  end

end
