require 'rails_helper'

describe "user sees all categories" do
  scenario "sees all categories" do
    Category.create!(title: 'Software')
    Category.create!(title: 'Sports')

    visit categories_path

    expect(page).to have_content('Software')
    expect(page).to have_content('Sports')
  end

end
