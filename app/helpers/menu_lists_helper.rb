module MenuListsHelper
  def make_randam_menu(menu_lists)
    @randam_menu = menu_lists.offset(rand(menu_lists.count)).first
  end
end
