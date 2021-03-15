class MenuListsController < ApplicationController
  before_action :set_menu_list, only: [:show, :edit, :update, :destroy]

  def index
    @menu_list = MenuList.all
  end

  def new
    @menu_list = MenuList.new
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def create
    @menu_list = MenuList.new(menu_list_params)
    @menu_list.user_id = current_user.id
    @menu_list.family_id = Family.find_by(family_name:params[:menu_list][:family_id]).id
    if @menu_list.save
      redirect_to menu_lists_path,notice: "メニューを追加しました！"
    else
      render :new
    end
  end

    private
    def menu_list_params
      params.require(:menu_list).permit( :menu_name, :user_id, :image )
    end

    def set_menu_list
      @menu_list = MenuList.find(params[:id])
    end
end
