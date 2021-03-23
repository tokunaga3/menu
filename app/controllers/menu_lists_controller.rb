class MenuListsController < ApplicationController
  before_action :authenticate_user!
  before_action :user_signed_in?
  before_action :set_menu_list, only: [:edit, :update, :destroy]
  before_action :set_family, only: [:show, :index]
  before_action :set_menu_family, only: [:show, :index]

  PER = 8

  def index
    @menu_lists = current_user.menu_lists
  end


  def show
    @menu_lists = current_user.menu_lists.page(params[:page]).per(PER)
  end

  def edit
  end

  def update
  end

  def destroy
    if @menu_list.destroy
      redirect_to menu_list_path, notice:"削除しました！"
    else
    end
  end

  def create
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

  def randam_menu
    @menu_lists = current_user.menu_lists
    respond_to do |format|
      format.js { render :randam_menu }
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
      @families = Family.where(user_id:current_user.id)
    end
end
