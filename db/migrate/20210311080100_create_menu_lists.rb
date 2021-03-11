class CreateMenuLists < ActiveRecord::Migration[5.2]
  def change
    create_table :menu_lists do |t|
      t.string :menu_name,null: false, default: ""
      t.references :user, foreign_key: true,null: false
      t.references :family, foreign_key: true,null: false
      t.timestamps
    end
  end
end
