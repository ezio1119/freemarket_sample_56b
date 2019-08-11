class ChangeColumnToUser < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :first_name_ruby, :first_name_kana
    rename_column :users, :last_name_ruby, :last_name_kana
  end

end
