class Family < ApplicationRecord
  belongs_to :user
  has_many :menu_lists, dependent: :destroy
  has_many :menu_families, dependent: :destroy
  has_many :menu_lists, through: :menu_families
  validates:family_name,presence: true

end
