require 'rails_helper'

feature "Email signin/signout" do
  before do
    @user = create(:user)
  end

  # scenario "can signin" do
  #   visit new_user_session_path
  #   fill_in "user_email", with: @user.email
  #   fill_in "user_password", with: @user.password
  #   binding.pry
  #   find('input[name="commit"]').click
  #   # expect(page).not_to have_link('signin')
  # end

  scenario "can not signin" do
    visit new_user_session_path
    fill_in "user_email", with: 'other@example.com'
    fill_in "user_password", with: 'other'
    find('input[name="commit"]').click
    expect(current_path).to eq new_user_session_path
  end

  scenario "user sign out" do
    logout(:user)

    expect(page).not_to have_link('signout')
  end
end