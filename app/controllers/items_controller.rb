class ItemsController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :kjname, :namekj, :knname, :namekn, :dob)
  end
end
