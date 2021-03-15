class MenuFamily < ApplicationRecord
  belongs_to :menu_list
  belongs_to :family
end
