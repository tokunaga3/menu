class Family < ApplicationRecord
  belongs_to :user
  has_many :menu_lists, dependent: :destroy
end
