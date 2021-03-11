class MenuListsController < ApplicationController
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
    if @menu_list.save
      redirect_to menu_lists_path,notice: "メニューを追加しました！"
    else
      render :new
    end
  end

  private
    def menu_list_params
      params.require(:menu_list).permit( :menu_name, :user_id, :family_id)
    end

    def set_menu_list
      @menu_list = MenuList.find(params[:id])
    end
end
