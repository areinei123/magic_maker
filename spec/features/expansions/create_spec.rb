require 'rails_helper'

feature 'expasion create' do
  let!(:user) {FactoryGirl.create(:user)}
  scenario 'create an expasion' do
    current_user = user
    visit root_path
    expect(page).to have_content('Click here to create a new set')
    click_on 'Click here'
    fill_in 'Set name', with: "Cool Expansion"
    fill_in 'Set size', with: 250
    fill_in 'Set description', with: "Its cool!"
    click_on 'Create'
    expect(page).to have_content('Cool Expansion')
  end
end
