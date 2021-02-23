require 'rails_helper'

RSpec.feature 'Friendships', type: :feature do
  before :each do
    @user1 = User.create!(name: 'marco', email: 'marco@gmail.com', password: 'marcomarco')
    @user2 = User.create!(name: 'bello', email: 'bello@gmail.com', password: 'bellobello')
  end

  scenario 'user 1 logs in and sends invitation then user 2 accepts it' do
    visit new_user_session_path
    fill_in 'Email', with: 'marco@gmail.com'
    fill_in 'Password', with: 'marcomarco'
    click_button 'Log in'
    visit users_path
    click_button 'Invite'
    expect(page).not_to have_selector(:link_or_button, 'Invite')
    click_link 'Sign out'

    visit new_user_session_path
    fill_in 'Email', with: 'bello@gmail.com'
    fill_in 'Password', with: 'bellobello'
    click_button 'Log in'
    click_link 'Your Profile'
    expect(page).to have_selector(:link_or_button, 'Accept Request')
    expect(page).to have_selector(:link_or_button, 'Reject Request')
    click_link 'Accept Request'
  end
end
