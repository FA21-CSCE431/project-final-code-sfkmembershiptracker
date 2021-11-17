require 'rails_helper'
require 'omniauth_helpers'

RSpec.describe 'Test OAuth', type: :feature do
  before(:each) do
    Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
  end

  scenario 'Make GET request instead of POST' do
    visit user_google_oauth2_omniauth_authorize_path
    expect(page).to have_content('Not found. Authentication passthru.')
  end

  scenario 'Check status when not logged in' do
    visit '/status'
    expect(page).to have_content("You need to sign in or sign up before continuing.")
  end

  scenario 'Sign in with OAuth' do
    visit '/'
    set_omniauth()
    click_button 'Login/Register'
    visit '/status'
    expect(page).to have_content('Status')
  end

  # scenario 'Sign in to OAuth with invalid credentials' do
  #   visit '/'
  #   set_invalid_omniauth()
  #   click_button 'Login/Register'
  #   expect(page).to have_content('Status')
  # end

  scenario 'Log out with OAuth' do
    visit '/'
    set_omniauth()
    click_button 'Login/Register'
    visit '/'
    click_link 'Logout'
    visit '/status'
    expect(page).to have_content("You need to sign in or sign up before continuing.")
  end
end

RSpec.describe 'Test status page', type: :feature do
  before(:each) do
    Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
  end

  scenario 'Redirect to Status Page' do
    visit '/'
    set_omniauth({uid: '1234', email: 'test@example.com', full_name: 'John Doe', avatar_url: ''})
    click_button 'Login/Register'
    visit '/profile'
    expect(page).to have_content("Application Status")
  end

  scenario 'Check status when not logged in' do
    visit '/status'
    expect(page).to have_content("You need to sign in or sign up before continuing.")
  end

  scenario 'Check status after being accepted' do
    visit '/'
    set_omniauth({
      uid: '117000275485057102157',
      email: 'sclark@tamu.edu',
      full_name: 'Steven Clark',
      avatar_url: 'https://lh3.googleusercontent.com/a-/AOh14Ghdo_SG5FBV75pKSdSwOs1iiDEv1EYm56Mi57SY=s96-c'
    })
    click_button 'Login/Register'
    visit '/status'
    expect(page).to have_content("Congratulations, your application has been approved. Welcome to Sports For Kids!")
  end

end

RSpec.describe 'Test Org Position Permissions', type: :feature do
  before(:each) do
    Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
  end

  scenario 'Visit profile as applicant' do
    visit '/profile'
    expect(page).to have_content("Application Status")
  end

  scenario 'Visit profile as member' do
    visit '/'
    set_omniauth({
      uid: '117000275485057102157',
      email: 'sclark@tamu.edu',
      full_name: 'Steven Clark',
      avatar_url: 'https://lh3.googleusercontent.com/a-/AOh14Ghdo_SG5FBV75pKSdSwOs1iiDEv1EYm56Mi57SY=s96-c'
    })
    click_button 'Login/Register'
    visit '/profile'
    expect(page).to have_content("Profile")
  end

  scenario 'Visit dashboard as applicant' do
    visit '/dashboard'
    expect(page).to have_content("You must be a member of this organization to access this resource.")
  end

  scenario 'Visit dashboard as member' do
    visit '/'
    set_omniauth({
      uid: '117000275485057102157',
      email: 'sclark@tamu.edu',
      full_name: 'Steven Clark',
      avatar_url: 'https://lh3.googleusercontent.com/a-/AOh14Ghdo_SG5FBV75pKSdSwOs1iiDEv1EYm56Mi57SY=s96-c'
    })
    click_button 'Login/Register'
    visit '/dashboard'
    expect(page).to have_content("Your Points")
  end
  
  scenario 'Visit dashboard as admin' do
    visit '/'
    set_omniauth()
    click_button 'Login/Register'
    visit '/dashboard'
    expect(page).to have_content("Admin Dashboard")
  end

  scenario 'Visit member roster as admin' do
    visit '/'
    set_omniauth()
    click_button 'Login/Register'
    visit '/members'
    expect(page).to have_content("Members")
  end

  scenario 'Visit member roster as member' do
    visit '/'
    set_omniauth({
      uid: '117000275485057102157',
      email: 'sclark@tamu.edu',
      full_name: 'Steven Clark',
      avatar_url: 'https://lh3.googleusercontent.com/a-/AOh14Ghdo_SG5FBV75pKSdSwOs1iiDEv1EYm56Mi57SY=s96-c'
    })
    click_button 'Login/Register'
    visit '/members'
    expect(page).to have_content("You don't have permission to view the member roster.")
  end
end
