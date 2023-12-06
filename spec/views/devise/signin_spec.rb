# spec/features/user_sign_in_spec.rb

require 'rails_helper'

RSpec.feature 'User Sign In', type: :feature do
  let(:user) { create(:user) }

  scenario 'User signs in with valid credentials' do
    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    # expect(page).to have_content('Signed in successfully')
    expect(page).to have_current_path(root_path)
  end

  scenario 'User fails to sign in with invalid credentials' do
    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'wrong_password'

    click_button 'Log in'

    # expect(page).to have_content('Invalid Email or password.')
    expect(page).to have_current_path(new_user_session_path)
  end
end