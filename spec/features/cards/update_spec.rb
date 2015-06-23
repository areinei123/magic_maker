require 'rails_helper'

feature 'expasion create' do
  let!(:user) {FactoryGirl.create(:user)}
  let!(:expansion) {FactoryGirl.create(:expansion)}
  let!(:card) {FactoryGirl.create(:card, expansion_id: expansion.id)}
  scenario 'update an existing card' do
    current_user = user
    visit expansion_path(expansion)
    click_on card.name
    expect(page).to have_content('Update')
    click_on 'Update'
    fill_in :card_name, with: "Astral Conflux"
    fill_in :card_mana_cost, with: "1{U}"
    fill_in :card_main_type, with: "Enchantment"
    fill_in :card_sub_type, with: ""
    fill_in :card_rules_text, with: "Pay 1 life: Destroy target enchantment"
    click_on 'Submit'
    expect(page).to have_content('Astral Conflux')
  end
end