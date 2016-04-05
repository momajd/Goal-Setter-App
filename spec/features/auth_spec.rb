require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content "New user"
  end

  feature "signing up a user" do
    before(:each) do
     visit new_user_url
     fill_in 'Username', :with => "testing_username"
     fill_in 'Password', :with => "biscuits"
     click_on "Create User"
   end

    scenario 'shows username on the homepage after signup' do
      expect(page).to have_content('testing_username', count: 2)
    end

    scenario "redirects to user's show page" do
      expect(current_path).to eq(user_path(User.last))
    end
  end

end

feature "logging in" do

  scenario "has a login page" do
    visit new_session_url
    expect(page).to have_content "Login"
  end

  feature "logging in a user" do
    before(:each) do
      # sign_up('testing_username')
      FactoryGirl.build(:user)
      visit new_session_url
      fill_in 'Username', :with => "Bob"
      fill_in 'Password', :with => "password"
      click_on "Login"
    end

    scenario 'shows username on the homepage after login' do
      expect(page).to have_content('testing_username', count: 2)
    end

    scenario "redirects to user's show page" do
      expect(current_path).to eq(user_path(User.last))
    end
  end
end

feature "logging out" do

  scenario "begins with logged out state" do
    visit users_url
    expect(page).to_have have_content('Sign Up')
  end

  scenario "doesn't show username on the homepage after logout" do
    sign_up('testing_username')
    click_on "Logout"
    expect(page).not_to have_content('testing_username')
  end

end
