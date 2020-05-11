class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update]
  before_action :user_params, only: :update

  def show
    @latest_messages = Message.where(to_id: current_user.id).order("created_at DESC").page(params[:page]).per(6)
  end
  
  def edit
    if user_signed_in? && current_user.id == @user.id
      @find_post = Post.find_by(user_id: current_user.id)
    else
      redirect_to new_user_registration_path, alert: 'ログインをお願いします'
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: 'プロフィールの編集が完了しました'
    else
      render :edit, notice: 'プロフィールの編集ができません'
    end
  end

  def mentor
    
  end

  def mentee
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    if @user.email != 'guest@example.com'
      params.require(:user).permit(:name, :image)
    else
      redirect_to user_path(@user.id), alert: 'ゲストユーザーは編集できません'
    end
  end

end

