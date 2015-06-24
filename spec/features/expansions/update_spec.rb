require 'rails_helper'

feature 'expansions update' do
  let!(:user) {FactoryGirl.create(:user)}
  let!(:expansion) {FactoryGirl.create(:expansion)}
  scenario 'update an expansion' do
    current_user = user
    visit expansion_path(expansion.id)
    click_on 'Update'
    fill_in :expansion_set_name, with: 'Updated Expansion'
    click_on 'Finished'
    expect(page).to have_content('Updated Expansion')
  end
end