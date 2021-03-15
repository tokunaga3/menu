class MenuList < ApplicationRecord
  belongs_to :user
  belongs_to :family

  has_many :menu_families, dependent: :destroy
  has_many :families, through: :menu_families

end
