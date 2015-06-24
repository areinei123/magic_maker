require 'rails_helper'

feature 'expansions index' do 
  let!(:user) {FactoryGirl.create(:user)}
  let!(:expansion) {FactoryGirl.create(:expansion)}
  scenario 'see all the expansions' do
    current_user = user
    visit root_path
    expect(page).to have_content(expansion.set_name)
  end
end