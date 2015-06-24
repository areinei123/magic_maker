class Expansion < ActiveRecord::Base
  validates :set_name, presence: true
  validates :set_size, presence: true
  has_many :cards

  def card_count
    cards = Card.where(expansion_id: id).count
  end
end