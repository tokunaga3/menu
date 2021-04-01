# == Schema Information
#
# Table name: menu_lists
#
#  id         :bigint           not null, primary key
#  image      :text
#  menu_name  :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  family_id  :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_menu_lists_on_family_id  (family_id)
#  index_menu_lists_on_user_id    (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (family_id => families.id)
#  fk_rails_...  (user_id => users.id)
#
class MenuList < ApplicationRecord
  belongs_to :user
  belongs_to :family

  has_many :menu_families, dependent: :destroy
  has_many :families, through: :menu_families
  mount_uploader :image, ImageUploader

end
