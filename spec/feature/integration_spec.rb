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

RSpec.describe 'Test Announcements', type: :feature do  
  scenario 'Valid inputs' do
	# Need OAuth
	visit new_blog_post_path
	fill_in 'Name', with: 'John Doe'
	fill_in 'Position', with: 'Officer'
	fill_in 'Message', with: 'This is a test message.'
	click_on 'Create Blog post'
	visit blog_posts_path
	expect(page).to have_content('John Doe')
	expect(page).to have_content('Officer')
	expect(page).to have_content('This is a test message.')
  end
  
  scenario 'Only name was input' do
    # Need OAuth
	visit new_blog_post_path
	fill_in 'Name', with: 'John Doe'
	click_on 'Create Blog post'
	visit blog_posts_path
	expect(page).not_to have_content('John Doe',)
  end
  
  scenario 'Only position was input' do
    # Need OAuth
	visit new_blog_post_path
	fill_in 'Position', with: 'Member'
	click_on 'Create Blog post'
	visit blog_posts_path
	expect(page).not_to have_content('Member',)
  end
  
  scenario 'Only message was input' do
    # Need OAuth
	visit new_blog_post_path
	fill_in 'Message', with: 'Another test message.'
	click_on 'Create Blog post'
	visit blog_posts_path
	expect(page).not_to have_content('Another test message.',)
  end
end