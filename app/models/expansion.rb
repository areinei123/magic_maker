class Expansion < ActiveRecord::Base
  validates :set_name, presence: true
  validates :set_size, presence: true
  has_many :cards
  has_many :users
end