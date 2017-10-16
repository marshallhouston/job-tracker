require 'rails_helper'

describe "user edits an existing job" do
  before :each do
    @company = Company.create!(name: 'REI')
    @job = @company.jobs.create!(title: 'ski instructor', description: 'teach folks to ski', level_of_interest: 3, city: 'Breckenridge')
  end

  it "user sees the current job listed" do
    visit edit_company_job_path(@company, @job)

    expect(page).to have_content(@job.title)
  end

  it "user can update the job" do
    visit edit_company_job_path(@company, @job)

    fill_in "job[title]", with: "ski guide"
    click_button "Update"

    expect(current_path).to eq(company_job_path(@company, @job))
    expect(page).to have_content("ski guide")
    expect(page).to_not have_content("ski instructor")
  end
end
