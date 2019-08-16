class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :bought, foreign_key: { to_table: :users }
      t.references :sold, foreign_key: { to_table: :users }
      t.references :item, index: { unique: true }, foreign_key: true
      t.string :charge, index: { unique: true }
      
      t.timestamps
    end
  end
end