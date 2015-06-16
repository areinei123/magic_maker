require 'rails_helper'

feature 'expansion show' do
  let!(:user) {FactoryGirl.create(:user)}
  let!(:expansion) {FactoryGirl.create(:expansion)}
  let!(:card) {FactoryGirl.create(:card, expansion_id: expansion.id)}
  scenario 'see one expansion page' do
    visit expansion_path(expansion)
    click_on card.name
    expect(page).to have_content(card.name)
  end
end