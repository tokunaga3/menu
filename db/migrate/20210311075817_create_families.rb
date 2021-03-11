class CreateFamilies < ActiveRecord::Migration[5.2]
  def change
    create_table :families do |t|
      t.string :family_name,null: false, default: ""
      t.references :user, foreign_key: true,null: false
      t.timestamps
    end
  end
end
