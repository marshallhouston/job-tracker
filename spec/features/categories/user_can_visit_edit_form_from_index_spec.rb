require 'rails_helper'

describe "user can navigate to the edit form for a category from the index page" do
  context "user is on the category index page"
    scenario "user clicks on the edit link and it takes them to the edit form" do
      category1= Category.create!(title: 'Software')
      Category.create!(title: 'Sports')

      visit categories_path
      within('.category') do
        first(:link, "Edit").click
      end

      expect(current_path).to eq(edit_category_path(category1))
      expect(page).to have_content('Software')
    end
end
