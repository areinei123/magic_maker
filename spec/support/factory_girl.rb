require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :expansion do
    sequence(:name) {|n| "The #{n}th expansion"}
    set_size 255
  end

  factory :card do
    sequence(:name) {|n| "Wood Elf #{n}"}
    mana_cost "G"
    main_type "Creature"
    sub_type "Elf"
    rules_text "Forestwalk"
    flavor_text "You miss every shot you dont't drink. - Andre the Giant"
    power 1
    toughness 1
  end
end
