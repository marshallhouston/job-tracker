require 'rails_helper'

describe "user creates a new category" do
  context "user creates a unique category"
    scenario "a user creates a category" do
      visit new_category_path

      fill_in "category[title]", with: "Software"

      click_button "Create"

      expect(current_path).to eq("/categories/#{Category.last.id}")
      expect(page).to have_content("Software")
    end

  context "user tries to create a category that already exists"
    scenario "a user is taken back to the new form when creating a category that already exists" do
      Category.create!(title: 'Software')

      visit new_category_path

      fill_in "category[title]", with: 'Software'

      click_button "Create"

      expect(current_path).to eq(new_category_path)
    end
end
