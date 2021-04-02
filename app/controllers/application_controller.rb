class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

 def after_sign_in_path_for(resource)
   menu_lists_path
 end

 def after_sign_out_path_for(resource)
   new_user_session_path # ログアウト後に遷移するpathを設定
 end

 def set_menu_family
   @menu_list = MenuList.new
   @family = Family.new
 end

 def current_families
   @families = Family.where(user_id:current_user.id)
 end

 def set_menu_lists
   @menu_lists_all = current_user.menu_lists
 end

 def set_menu_lists_page
   set_menu_lists
   per = 8
   @menu_lists = @menu_lists_all.page(params[:page]).per(per)
 end

 def guest_check
   if  current_user[:name] =="Guest"
     redirect_to menu_lists_path,notice: "ゲストアカウントではこの操作はできません"
   end
 end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
