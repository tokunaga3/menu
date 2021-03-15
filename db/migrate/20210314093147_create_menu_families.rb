class CreateMenuFamilies < ActiveRecord::Migration[5.2]
  def change
    create_table :menu_families do |t|
      t.references :menu_list, foreign_key: true
      t.references :family, foreign_key: true


      t.timestamps
    end
  end
end
