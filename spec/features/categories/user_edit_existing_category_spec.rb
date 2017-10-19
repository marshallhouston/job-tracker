require 'rails_helper'

describe "user can edit an existing category" do
  context "user is on the category index page and can go to edit form"
    scenario "user clicks on the edit link and it takes them to the edit form" do
      category1= Category.create!(title: 'Software')
      Category.create!(title: 'Sports')

      visit categories_path
      within('li.category:first-child') do
        first(:link, "Edit").click
      end

      expect(current_path).to eq(edit_category_path(category1))
      expect(page).to have_content('Software')
    end

  context "user edits the category from the edit_category_path" do
    scenario "user edits the category" do
      category1= Category.create!(title: 'Software')

      visit edit_category_path(category1)

      fill_in "category[title]", with: 'Education'
      click_button "Update"

      expect(current_path).to eq(category_path(category1))
      expect(page).to have_content('Education')
      expect(page).to_not have_content('Software')
    end
  end
end
