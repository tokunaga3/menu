class MenuListsController < ApplicationController
  before_action :set_menu_list, only: [:edit, :update, :destroy]
  before_action :set_family, only: [:show, :index]
  before_action :user_signed_in?
  before_action :authenticate_user!

  def index
    @menu_list = current_user.menu_lists
    @menu_lists = MenuList.new
  end

  # def new
  # end

  def show
    @menu_list = current_user.menu_lists
  end

  def edit
  end

  def update
  end

  def destroy
  end
  def create
    @menu_lists = current_user.menu_lists
    @menu_list = MenuList.new(menu_list_params)
    @menu_list.user_id = current_user.id
    @menu_list.family_id = Family.find_by(family_name:params[:menu_list][:family_id]).id
    respond_to do |format|
      if @menu_list.save
        format.js { render :index }
      else
        format.html { redirect_to menu_list_path(@menu_list), notice: '投稿できませんでした...' }
      end
    end
  end

    private
    def menu_list_params
      params.require(:menu_list).permit( :menu_name, :user_id, :image )
    end

    def set_menu_list
      @menu_list = MenuList.find(params[:id])
    end

    def set_family
      @family = Family.where(user_id:current_user.id)
    end
end


# 保険用
# class MenuListsController < ApplicationController
#   before_action :set_menu_list, only: [:edit, :update, :destroy]
#   before_action :set_family, only: [:show, :new]
#   before_action :user_signed_in?
#   before_action :authenticate_user!
#
#   def index
#     @menu_list = current_user.menu_lists
#   end
#
#   def new
#     @menu_list = MenuList.new
#   end
#
#   def show
#     @menu_list = current_user.menu_lists
#   end
#
#   def edit
#   end
#
#   def update
#   end
#
#   def destroy
#   end
#
#   def create
#     @menu_list = MenuList.new(menu_list_params)
#     @menu_list.user_id = current_user.id
#     @menu_list.family_id = Family.find_by(family_name:params[:menu_list][:family_id]).id
#     if @menu_list.save
#       redirect_to menu_lists_path,notice: "メニューを追加しました！"
#     else
#       render :new
#     end
#   end
#
#     private
#     def menu_list_params
#       params.require(:menu_list).permit( :menu_name, :user_id, :image )
#     end
#
#     def set_menu_list
#       binding.pry
#       @menu_list = MenuList.find(params[:id])
#     end
#
#     def set_family
#       @family = Family.where(user_id:current_user.id)
#     end
# end
