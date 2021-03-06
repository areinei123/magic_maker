class AddCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :name, null: false, length: { minimum: 3, maximum: 40 }
      t.string :mana_cost, 
        null: false, 
        inclusion: { in: %w(/[Xx]/ /[Rr]/ /[Gg]/ /[Bb]/ /[Uu]/ /[Ww]/ /\d/)}
      t.string :main_type, null: false, length: {maximum: 30}
      t.string :sub_type, length: {maximum: 30}
      t.string :rules_text
      t.string :flavor_text, length: {maximum: 100}
      t.integer :power, numericality: {only_integer: true}
      t.integer :toughness, numericality: {only_integer: true}
      t.string :extra_rules
      t.string :image
      t.integer :expansion_id, null:false
      t.integer :user_id
    end
  end
end
