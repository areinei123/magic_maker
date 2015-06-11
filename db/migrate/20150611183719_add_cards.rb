class AddCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :name, null: false, length: { minimum: 3, maximum: 15 }
      t.string :mana_cost, 
        null: false, 
        inclusion: { in: %w(/[Xx]/ /[Rr]/ /[Gg]/ /[Bb]/ /[Uu]/ /[Ww]/ /\d/)}
      t.string :main_type, null: false, length: {maximum: 15}
      t.string :sub_type, length: {maximum: 15}
      t.string :rules_text
      t.string :flavor_text, length: {maximum: 50}
      t.integer :power, numericality: {only_integer: true}
      t.integer :toughness, numericality: {only_integer: true}
    end
  end
end
