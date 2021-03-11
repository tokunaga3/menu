class User < ApplicationRecord
  has_many :menu_lists, dependent: :destroy
  has_many :families, dependent: :destroy
end
