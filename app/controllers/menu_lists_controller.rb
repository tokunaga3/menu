class MenuListsController < ApplicationController
  before_action :authenticate_user!
  before_action :user_signed_in?
  before_action :set_menu_list, only: [:edit, :update, :destroy]
  before_action :current_families, only: [:show, :index, :edit, :update, :destroy]
  before_action :set_menu_family, only: [:show, :index]
  before_action :set_menu_lists, only: [:show, :update, :destroy]


  PER = 8

  def index
    @menu_lists = current_user.menu_lists
  end


  def show
  end

  def edit
    respond_to do |format|
      flash.now[:notice] = '編集中'
      format.js { render :edit }
    end
  end

  def update
     respond_to do |format|
      if @menu_list.update(menu_list_params)
        flash.now[:notice] = '更新できました'
        format.js { render :update }
      else
        flash.now[:notice] = '更新できませんでした'
        format.js { render :update }
        # redirect_to menu_list_path, notice:"#{@menu_list.menu_name}を更新できませんでした！"
      end
    end
  end

  def destroy
    respond_to do |format|
      if @menu_list.destroy
        flash.now[:notice] = '削除しました'
        format.js { render :destroy }
      else
        flash.now[:notice] = '削除できませんでした'
        format.js { render :destroy }
        # redirect_to menu_list_path, notice:"削除できませんでした！"
      end
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

    def set_menu_lists
      @menu_lists = current_user.menu_lists.page(params[:page]).per(PER)
    end

end
