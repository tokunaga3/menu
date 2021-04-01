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
require 'test_helper'

class MenuListTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
