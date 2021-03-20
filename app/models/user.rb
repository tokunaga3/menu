class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :menu_lists, dependent: :destroy
  has_many :families, dependent: :destroy
end
