class FamiliesController < ApplicationController
  before_action :set_family, only: [:show, :edit, :update, :destroy]


  def new
    @family = Family.new
  end

  def create
    @family = Family.new(family_params)
    @family.user_id = current_user.id
    if @family.save
      format.js { render :index,notice: "家族の名前を追加しました" }
      # redirect_to menu_lists_path,notice: "家族の名前を追加しました"
    else
      format.html { redirect_to menu_lists_path,notice: "家族の名前を追加しました" }
    end
  end

  #ajax実装用の保険
  # def create
  #   @family = Family.new(family_params)
  #   @family.user_id = current_user.id
  #   if @family.save
  #     redirect_to menu_lists_path,notice: "家族の名前を追加しました"
  #   else
  #     render :new
  #   end
  # end

  def family_params
    params.require(:family).permit( :family_name)
  end
  private

  def set_family
    @family = Family.find(params[:id])
  end

end
