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

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
