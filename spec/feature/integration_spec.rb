require 'rails_helper'

RSpec.describe 'Test OAuth', type: :feature do
  scenario 'Make GET request instead of POST' do
    visit user_google_oauth2_omniauth_authorize_path
    expect(page).to have_content('Not found. Authentication passthru.')
    visit '/status'
    expect(page).to have_content("You're Logged out!")
  end

  scenario 'Check status when not logged in' do
    visit '/status'
    expect(page).to have_content("You're Logged out!")
  end

  scenario 'Make GET request instead of POST' do
    visit user_google_oauth2_omniauth_authorize_path
    visit '/status'
    expect(page).to have_content('Status')
  end
end