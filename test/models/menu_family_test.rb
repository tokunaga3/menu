# == Schema Information
#
# Table name: menu_families
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  family_id    :bigint
#  menu_list_id :bigint
#
# Indexes
#
#  index_menu_families_on_family_id     (family_id)
#  index_menu_families_on_menu_list_id  (menu_list_id)
#
# Foreign Keys
#
#  fk_rails_...  (family_id => families.id)
#  fk_rails_...  (menu_list_id => menu_lists.id)
#
require 'test_helper'

class MenuFamilyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
