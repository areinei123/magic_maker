require 'rails_helper'

feature 'cards index' do
  let!(:user) {FactoryGirl.create(:user)}
  let!(:expansion) {FactoryGirl.create(:expansion)}
  let!(:card){FactoryGirl.create(:card, expansion_id: expansion.id)}
  scenario 'look at the cards index' do
    visit expansion_path(expansion)
    expect(page).to have_content(card.name)
  end
end