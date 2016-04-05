require 'spec_helper'
require 'rails_helper'

feature 'creating goal' do
  before(:each) do
    signup('testing_username')
  end

  scenario 'user show page to have new goal form' do
    visit user_url(1)
    expect(page).to have_content('New Goal')
  end

  feature 'new goal form' do

    scenario 'can mark public' do
      expect(page).to have_content "Public"
    end

    scenario 'can mark private' do
      expect(page).to have_content "Private"
    end

    scenario 'saves successfully for logged in user' do
      fill_in 'New Goal', with: "MY GOAL"
      choose 'Public'
      click_button 'Submit'
      expect(current_path).to match(/^\/users\/(\d)+/)
      expect(page).to have_content 'MY GOAL'
    end
  end

  scenario 'redirects to user show page when goal is created' do
    fill_in 'New Goal', with: "MY GOAL"
    choose 'Public'
    click_button 'Submit'
    expect(current_path).to match(/^\/users\/(\d)+/)
  end


end

feature 'deleting a goal' do

  scenario 'has a button to delete goal'

  scenario 'redirects to user show when goal is deleted'

end

feature 'updating a goal' do
  scenario 'has a link to edit goal'
  feature 'edit goal page' do
    scenario 'prefills form'
    scenario 'successfully updates goal'
  end

  scenario 'redirects to user show page on update'

  scenario 'redirects to login page if user not logged in'
end
