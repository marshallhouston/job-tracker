require 'rails_helper'

describe "user deletes an existing job" do
  scenario "a user can delete a job" do
    company = Company.create!(name: 'REI')
    category = Category.create!(title: 'Outdoors')
    job = company.jobs.create!(title: 'ski instructor', description: 'teach folks to ski', level_of_interest: 3, city: 'Breckenridge', category: category)

    visit company_job_path(company, job)

    click_link "Delete Job"

    expect(page).to have_content("ski instructor was successfully deleted!")
  end
end
