require 'rails_helper'

describe "user sees dashboard" do
  context "dashboard is the homepage"
    scenario "dashboard is the root/homepage" do
      visit "/"

      expect(page).to have_content("Dashboard")
    end

  before :each do
    visit dashboard_index_path

    company = Company.new(name: "Turing")
    category = Category.new(title: "Fun")
    Job.create!(title: "Software", level_of_interest: 60, city: "Boulder", description: "Wahooo", company: company, category: category)
    Job.create!(title: "Sports", level_of_interest: 60, city: "Denver", description: "Wahooo", company: company, category: category)
    Job.create!(title: "Sports", level_of_interest: 12, city: "Denver", description: "Wahooo", company: company, category: category)
  end

  scenario "dashboard has information about jobs by level_of_interest" do
    
  end

  scenario "dashboard has information about the top three companies by average level of interest" do

  end

  scenario "dashboard has information about the number of jobs by city" do

  end

end
