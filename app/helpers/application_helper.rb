module ApplicationHelper
  def have_image?(menu_list)
    unless menu_list.image.url =="default.jpg"
       image_tag menu_list.image.url, class:"img-fluid" ,alt:"Responsive image"
    end
  end

  def this_menu(families,menu_list)
    families.find(menu_list.family_id)
  end

  def family_check(family)
    if family.nil?
      @family = Family.new
    end
  end

  def menu_check(menu)
    if menu.nil?
      @menu_list = MenuList.new
    end
  end

end
