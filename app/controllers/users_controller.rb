class UsersController < ApplicationController

  before_action :set_user

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

end

