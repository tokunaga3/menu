class AddImageToMenuLists < ActiveRecord::Migration[5.2]
  def change
    add_column :menu_lists, :image, :text
  end
end
