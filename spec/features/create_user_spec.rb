require 'rails_helper'

feature "User signs up" do
  scenario "successful" do
    visit new_user_path

    fill_in "user[name]", with: "Test"
    fill_in "Email", with: "test@test.com"
    fill_in "Password", with: "asdasd"

    click_on "Continue"
    expect(page).to have_content("BreadyBrunch")
  end
end
