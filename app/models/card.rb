class Card < ActiveRecord::Base
  belongs_to :expansion
  belongs_to :user

  validates :name, presence: true, length: { minimum: 3, maximum: 40 }
  validates :mana_cost, presence: true
  validates :main_type, presence: true, length: {maximum: 30}
  validates :sub_type, length: {maximum: 30}
  validates :flavor_text, length: {maximum: 100}

  mount_uploader :image, CardImageUploader

  def mana_symbols
    @mana_array = mana_cost.split(' ') 
    @i = 0
    @mana_array.each do |symbol|
      symbol_check('{U}', "Manablue.gif") if symbol == "{U}"
      symbol_check('{B}', "Manablack.gif") if symbol == "{B}"
      symbol_check('{R}', "Manared.gif") if symbol == "{R}"
      symbol_check('{W}', "Manawhite.gif") if symbol == "{W}"
      symbol_check('{G}', "Managreen.gif") if symbol == "{G}"
      symbol_check('{A}', "Manabeer.gif") if symbol == "{A}"
      symbol_check('{X}', "ManaX.gif") if symbol == "{X}"
      symbol_check('{1}', "Manaone.gif") if symbol == "{1}"
      symbol_check('{2}', "Manatwo.gif") if symbol == "{2}"
      symbol_check('{3}', "Manathree.gif") if symbol == "{3}"
      symbol_check('{4}', "Manafour.gif") if symbol == "{4}"
      symbol_check('{5}', "Manafive.gif") if symbol == "{5}"
      symbol_check('{6}', "Manasix.gif") if symbol == "{6}"
      symbol_check('{7}', "Manaseven.gif") if symbol == "{7}"
      symbol_check('{8}', "Manaeight.gif") if symbol == "{8}"
      @i = @i + 1
    end
    @mana_array
  end

  def symbol_check(symbol, asset)
    @mana_array[@i] = symbol.gsub(symbol, "#{asset}")
  end

  def tap_symbol
    rules_text
  end
end