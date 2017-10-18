require 'rails_helper'

describe "user sees dashboard" do
  context "dashboard is the homepage"
    scenario "dashboard is the root/homepage" do
      visit "/"

      expect(page).to have_content("Dashboard")
    end

  # before :each do
  #   visit dashboard_path
  # end

  xscenario "dashboard has information about jobs by level_of_interest" do

  end

  xscenario "dashboard has information about the top three companies by average level of interest" do

  end


end
