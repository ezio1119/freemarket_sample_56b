class AddColumnUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name_ruby, :string, null: false
    add_column :users, :last_name_ruby, :string, null: false
  end
end
