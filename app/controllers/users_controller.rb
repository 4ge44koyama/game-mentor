class UsersController < ApplicationController

  before_action :set_user

  def show
<<<<<<< HEAD
    @user = User.find(params[:id])
=======
<<<<<<< Updated upstream
    
=======
  end

  def edit
>>>>>>> master
  end

  private
  def set_user
    @user = User.find(params[:id])
>>>>>>> Stashed changes
  end

end

