require 'rails_helper'

describe "user can create contacts" do
  before :each do
    @company = Company.create!(name: "Turing")

    visit company_path(@company)
  end

  scenario "user sees prompt to create contact" do
    expect(page).to have_content("Create a Contact")
  end

  scenario "user creates contact" do
    fill_in "contact[name]", with: "Kels"
    fill_in "contact[position]", with: "pragmatist"
    fill_in "contact[email]", with: "klong@kelzzz.com"
    click_button "Create"

    expect(current_path).to eq("/companies/#{@company.id}")
    expect(page).to have_content("Kels")
    expect(page).to have_content("pragmatist")
    expect(page).to have_content("klong@kelzzz.com")
  end

  scenario "user creates additional contact and both are on page" do
    fill_in "contact[name]", with: "Kels"
    fill_in "contact[position]", with: "pragmatist"
    fill_in "contact[email]", with: "klong@kelzzz.com"
    click_button "Create"

    fill_in "contact[name]", with: "Dave"
    fill_in "contact[position]", with: "gamer"
    fill_in "contact[email]", with: "dave@dave.com"
    click_button "Create"

    expect(page).to have_content("Kels")
    expect(page).to have_content("pragmatist")
    expect(page).to have_content("klong@kelzzz.com")
    expect(page).to have_content("Dave")
    expect(page).to have_content("gamer")
    expect(page).to have_content("dave@dave.com")
  end

end
