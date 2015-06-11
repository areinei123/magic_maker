class AddExpansion < ActiveRecord::Migration
  def change
    create_table :expansion do |t|
      t.string :set_name, null:false, length: { maximum: 20 }
      t.integer :set_size, null:false, numericality: { only_integer: true }
      t.string :set_desc, default: ""
    end
  end
end
