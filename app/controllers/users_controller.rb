class UsersController < ApplicationController
  def index
    @menu_lists = MenuList.where(user_id: User.where(name:"Guest").ids[0])
    # @menu_list = MenuList.where(user_id: User.where(name:"Guest").ids[0])
  end
end
