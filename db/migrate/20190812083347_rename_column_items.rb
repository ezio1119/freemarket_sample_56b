class RenameColumnItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :region, :prefecture_id
    rename_column :items, :state, :state_id
    rename_column :items, :delivery, :delivery_method_id
    rename_column :items, :days, :day_id
    add_column :items,:delivery_burden_id, :integer, null: false
  end
end
