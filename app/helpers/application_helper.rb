module ApplicationHelper
  def have_image?(menu_list)
    unless menu_list.image.url =="default.jpg"
       image_tag(menu_list.image.url)
    end
  end

  def this_menu(families,menu_list)
    families.find(menu_list.family_id)
  end
end
