# == Schema Information
#
# Table name: families
#
#  id          :bigint           not null, primary key
#  family_name :string           default(""), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_families_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Family < ApplicationRecord
  belongs_to :user
  has_many :menu_lists, dependent: :destroy
  has_many :menu_families, dependent: :destroy
  has_many :menu_lists, through: :menu_families
  validates:family_name,presence: true

  # ログインユーザーの登録されている家族を探す
  scope :current_families_name, -> (user_id) { where(user_id:(user_id)) }

end
