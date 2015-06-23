require 'rails_helper'

feature 'expasion create' do
  let!(:user) {FactoryGirl.create(:user)}
  let!(:expansion) {FactoryGirl.create(:expansion)}
  scenario 'create an card' do
    current_user = user
    visit expansion_path(expansion)
    expect(page).to have_content('Add a Card')
    click_on 'Add a Card'
    fill_in :card_name, with: "Astral Conflux"
    fill_in :card_mana_cost, with: "1{U}"
    fill_in :card_main_type, with: "Enchantment"
    fill_in :card_rules_text, with: "Pay 1 life: Destroy target enchantment"
    
    click_on 'Create'
    expect(page).to have_content('Astral Conflux')
  end
end