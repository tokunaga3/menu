class FamiliesController < ApplicationController
  before_action :set_family, only: [:show, :edit, :update, :destroy]

  def create
    @family = Family.new(family_params)
    @family.user_id = current_user.id
    respond_to do |format|
      if @family.save
        format.js { render :index }
      else
        format.html { redirect_to menu_lists_path,notice: "家族の名前を追加できませんでした" }
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
