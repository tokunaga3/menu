module ApplicationHelper
  def have_image?(menu_list)
    menu_list.image.url =="default.jpg"
  end
end
