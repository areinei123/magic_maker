require 'rails_helper'

feature 'expansion show' do
  let!(:user) {FactoryGirl.create(:user)}
  let!(:expansion) {FactoryGirl.create(:expansion)}
  scenario 'see one expansion page' do
    visit root_path
    click_on expansion.set_name
    expect(page).to have_content(expansion.set_size)
  end
end