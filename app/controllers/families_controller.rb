class FamiliesController < ApplicationController
  before_action :set_family, only: [:show, :edit, :update, :destroy]

  def create
    @family = Family.new(family_params)
    @family.user_id = current_user.id
    respond_to do |format|
      if @family.save
        @families = Family.where(user_id:current_user.id)
        format.js { render :index }
      else
        format.html { redirect_to menu_lists_path,notice: "家族の名前を追加できませんでした" }
      end
    end
  end

  def edit
    respond_to do |format|
      flash.now[:notice] = '編集中'
      format.js { render :edit }
    end
  end

  def destroy
  end

  private
  def family_params
    params.require(:family).permit( :family_name)
  end

  def set_family
    @family = Family.find(params[:id])
  end

end
