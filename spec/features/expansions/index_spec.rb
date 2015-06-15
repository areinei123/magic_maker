require 'rails_helper'

feature 'expansions index' do 
  let!(:expansion) {FactoryGirl.create(:expansion)}
  scenario 'see all the expansions' do
    visit root_path
    expect(page).to have_content(expansion.set_name)
  end
end