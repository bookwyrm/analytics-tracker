require 'rails_helper'

describe 'User registration' do
  let(:user_email) { Faker::Internet.email }
  let(:user_password) { Faker::Internet.password(8) }
  let(:company_name) { Faker::Company.name }

  before :each do
    visit new_user_registration_path

    fill_in 'user_company_name', with: company_name
    fill_in 'user_email', with: user_email
    fill_in 'user_password', with: user_password
    fill_in 'user_password_confirmation', with: user_password
    click_button 'Sign up'
  end

  it "lets the user log in" do
    visit new_user_session_path

    fill_in 'user_email', with: user_email
    fill_in 'user_password', with: user_password

    click_button 'Log in'
    expect(page).to have_content("Welcome")
  end

end
