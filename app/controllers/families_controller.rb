class FamiliesController < ApplicationController
  before_action :set_family, only: [:show, :edit, :destroy, :update]
  before_action :current_families, only: [:update, :edit]
  before_action :set_menu_lists_page, only: [:update, :edit, :destroy]
  # before_action :guest_check, only: [:update, :create, :destroy]
  before_action :menu_count_check, only: [:destroy]

  def create
    @family = Family.new(family_params)
    @family.user_id = current_user.id
    respond_to do |format|
      if @family.save
        @families = Family.current_families_name(current_user.id)
        format.js { render :index }
      else
        format.html { redirect_to menu_lists_path,notice: "家族の名前を追加できませんでした" }
      end
    end
  end

  def edit
    respond_to do |format|
      # @family_list_number = Family.current_families_name(current_user.id).pluck(:family_name).index(@family[:family_name])
      flash.now[:notice] = '編集中'
      format.js { render :edit }
    end
  end

  def update
    respond_to do |format|
      if @family.update(family_params)
        @families = Family.current_families_name(current_user.id)
        format.js { render :update }
      else
        redirect_to menu_lists_path,notice: "家族の名前を更新できませんでした"
      end
    end
  end

  def destroy
    respond_to do |format|
      if @family.destroy
        @families = Family.current_families_name(current_user.id)
        flash.now[:notice] = '削除しました'
        format.js { render :destroy }
      else
        flash.now[:notice] = '削除できませんでした'
        format.js { render :destroy }
        # redirect_to menu_list_path, notice:"削除できませんでした！"
      end
    end
  end

  private
  def family_params
    params.require(:family).permit( :family_name)
  end

  def set_family
    @family = Family.find(params[:id])
  end


end
