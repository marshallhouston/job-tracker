require 'rails_helper'

describe "user can delete an existing category" do
  before :each do
    Category.create!(title: 'Software')
    Category.create!(title: 'Sports')

    visit categories_path
  end

  scenario "user can delete a category" do
    within('li.category:first-child') do
      first(:link, "Delete").click
    end

    expect(page).to have_content('Sports')
    expect(page).to_not have_content('Software')
  end
end
