require "rails_helper"

RSpec.feature "Users can edit categories" do

  before do
    category = FactoryGirl.create(:category, title:"Books", description:"Best books on the world")

    visit '/'
    click_link "Categories"
    click_link "Books"
    click_link "Edit"

  end

  scenario "with valid details" do
    category = FactoryGirl.create(:category, title:"Books", description:"Best books on the world")

    fill_in "Title", with: "Video Games"
    click_button "Update Category"

    expect(page).to have_content "Category has been updated."
    expect(page).to have_content "Video Games"
  end

  scenario "with invalid attributes" do
    fill_in "Title", with: ""
    fill_in "Description", with: ""
    click_button "Update Category"

    expect(page).to have_content "Category has not been updated."
    expect(page).to have_content "Title can\'t be blank"
    expect(page).to have_content "Description can\'t be blank"

  end
end
