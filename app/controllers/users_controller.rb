class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update]
  before_action :user_params, only: :update

  def show
  end
  
  def edit
    @find_post = Post.find_by(user_id: current_user.id)
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: 'プロフィールの編集が完了しました'
    else
      render :edit, notice: 'プロフィールの編集ができません'
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :image)
  end

end

