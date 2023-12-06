require "rails_helper"

describe "User signs up", type: :feature do
  let(:email) { Faker::Internet.email }
  let(:password) { Faker::Internet.password(min_length: 8) }

  scenario "with valid data" do
    visit new_user_registration_path
    fill_in "user_email", with: email
    fill_in "user_password", with: password
    # check "terms_agreement"
    click_button "Sign up"

    # expect(page).to have_content("Welcome! You have signed up successfully.")
    # expect(page).to have_current_path(user_path)
  end

  scenario "invalid when email already exists" do
    visit new_user_registration_path
    user = create :user

    fill_in "user_email", with: user.email
    fill_in "user_password", with: password
    # check "terms_agreement"
    click_button "Sign up"

    # expect(page).to have_no_text "Welcome back"
    expect(page).to have_text "Email has already been taken"
  end

#   scenario "invalid without clicking agree terms" do
#     fill_in "user_email", with: email
#     fill_in "user_password", with: password
#     click_button "Get Started"

#     # expect(page).to have_no_text "Welcome back"
#     expect(page).to have_text "Terms of service must be accepted"
#   end
end