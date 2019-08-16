class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :payjp_cus, :string, index: { unique: true }
  end
end
