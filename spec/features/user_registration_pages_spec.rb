require 'rails_helper'

feature "user signup" do

  before do
    include Devise::Test::IntegrationHelpers
  end

  scenario "Registration Page" do
    
    visit root_path
    click_button "新規会員登録"

    click_link "メールアドレスで登録"

    fill_in "user_nickname",                with: "Example"
    fill_in "user_email",                   with: "test@example.com"
    fill_in "user_password",                with: "test123"
    fill_in "user_password_confirmation",   with: "test123"
    fill_in "user_first_name",              with: "ああ"
    fill_in "user_last_name",               with: "いい"
    fill_in "user_first_name_kana",         with: "アア"
    fill_in "user_last_name_kana",          with: "イイ"
    select "2000", from: "user_birth_date_1i"
    select "1", from: "user_birth_date_2i"
    select "1", from: "user_birth_date_3i"
    find('input[name="commit"]').click
    expect(page).to have_content('SNSを送信する')
    # expect(current_path).to eq users_tell_path
   
  end
end