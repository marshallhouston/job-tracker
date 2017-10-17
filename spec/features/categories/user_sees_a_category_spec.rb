require 'rails_helper'

describe "user can view a category" do
  scenario "a user sees a category" do
    category = Category.create!(title: "Sports")
    company = Company.create!(name: "ESPN")
    category.jobs.create!(title: "Developer", level_of_interest: 90, city: "Denver", company: company)

    visit category_path(category)

    expect(current_path).to eq("/categories/#{category.id}")
    # expect(page).to have_content("Sports")
  end
end
