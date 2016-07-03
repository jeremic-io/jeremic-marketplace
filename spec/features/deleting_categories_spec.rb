require "rails_helper"

RSpec.feature "Users can delete categories" do

  scenario "successfully" do

    category = FactoryGirl.create(:category, title: "Video Games", description: "Best games")


    visit '/categories'
    click_link 'Video Games'
    click_link 'Delete'

    expect(page).to have_content "Category has been deleted."
    expect(page.current_url).to eq categories_url
    expect(page).to have_no_content 'Video Games'

  end

end
