require 'rails_helper'

describe "user can create a comment on a job page" do
  before :each do
    company = Company.new(name: "Turing")
    category = Category.new(title: "Fun")
    @job = Job.create!(title: "Developer", description: "Wahoo", level_of_interest: 40, city: "Denver", company: company, category: category)
  end

  context "user is on a jobs page that doesn't have any comments"
    scenario "user is prompted to create a comment" do
      visit job_path(@job)
      expect(page).to have_content("Post a Comment")
    end

    scenario "user posts comments and it shows up on page" do

      visit job_path(@job)

      fill_in "Your Comment", with: "Seems fun"
      click_button "Create Comment"

      expect(current_path).to eq("/jobs/#{@job.id}")
      expect(page).to have_content("Seems fun")
    end

  context "user is a on jobs page that has a comment"
    scenario "user posts comment and it is the first comment on page" do
      visit job_path(@job)

      fill_in "Your Comment", with: "Seems fun"
      click_button "Create Comment"

      fill_in "Your Comment", with: "fun"
      click_button "Create Comment"

      fill_in "Your Comment", with: "Not that fun"
      click_button "Create Comment"

      expect(page).to have_content("Not that fun")
      expect(page).to have_content("Seems fun")

      within("section:first-child") do
        expect(page).to have_content("Not that fun")
      end
      within("section:last-child") do
        expect(page).to have_content("Seems fun")
      end
    end
end
