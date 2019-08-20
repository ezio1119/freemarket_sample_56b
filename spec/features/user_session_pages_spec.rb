require 'rails_helper'

feature "Email signin/signout" do

  let(:user) { create(:user) }

    before { visit root_path }

  scenario "can signin" do
    visit new_user_session_path
    fill_in "user_email", with: user.email
    fill_in "user_password", with: user.password
    find('input[name="commit"]').click
    expect(current_path).to eq root_path
    expect(page).not_to have_link('signin')
  end

  scenario "can not signin" do
    visit new_user_session_path
    fill_in "user_email", with: 'other@example.com'
    fill_in "user_password", with: 'other'
    find('input[name="commit"]').click
    expect(current_path).to eq new_user_session_path
  end

  scenario "user sign out" do
    logout(:user)  

    expect(current_path).to eq root_path
    expect(page).not_to have_link('signout')
    expect(page).to have_http_status(200)
  end
end