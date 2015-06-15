class Card < ActiveRecord::Base
  belongs_to :expansion

  validates :name, presence: true, length: { minimum: 3, maximum: 15 }
  validates :mana_cost, presence: true
  validates :main_type, presence: true, length: {maximum: 15}
  validates :sub_type, length: {maximum: 15}
  validates :flavor_text, length: {maximum: 100}
end