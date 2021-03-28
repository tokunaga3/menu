class Family < ApplicationRecord
  belongs_to :user
  has_many :menu_lists, dependent: :destroy
  has_many :menu_families, dependent: :destroy
  has_many :menu_lists, through: :menu_families
  validates:family_name,presence: true

  scope :current_families_name, -> (user_id) { where(user_id:(user_id)) }

end
