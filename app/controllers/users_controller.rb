class UsersController < ApplicationController

  before_action :set_user

  def show
<<<<<<< Updated upstream
    
=======
  end

  def edit
  end

  private
  def set_user
    @user = User.find(params[:id])
>>>>>>> Stashed changes
  end

end

