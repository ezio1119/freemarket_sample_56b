require "rails_helper"

feature "omniauth-facebook signin/signout" do

  before do
    Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
    OmniAuth.config.mock_auth[:facebook] = nil
    Rails.application.env_config['omniauth.auth'] = facebook_mock
  end

  scenario "can signin" do
    visit new_user_session_path
    click_link "Facebookでログイン"
    expect(page).not_to have_link('signin')
  end

  scenario "can not signin" do
    OmniAuth.config.add_mock(:facebook, {uid: '123545', name: 'foo bar'})
    visit new_user_session_path
    click_link "Facebookでログイン"
    expect(current_path).to eq new_user_registration_path
  end

  scenario "signout" do
    logout(:user) 
    expect(page).not_to have_link('signout')
  end
end