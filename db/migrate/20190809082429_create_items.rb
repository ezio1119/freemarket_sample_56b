class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer   :size
      t.text      :name, null: false, add_index: true
      t.integer   :delivery, null: false
      t.integer   :region, null: false
      t.integer   :days, null: false
      t.integer   :price, null: false
      t.text      :info, null: false
      t.references  :user, foreign_key: true 
      t.timestamps
    end
  end
end
