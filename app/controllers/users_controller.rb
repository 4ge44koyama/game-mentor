class UsersController < ApplicationController
  include UsersHelper
  before_action :move_to_login
  before_action :set_user, only: %i[show edit update mentor mentee]
  before_action :check_user, only: %i[show edit update mentor mentee]
  before_action :user_params, only: :update

  def show
    @latest_messages = Message.where(to_id: current_user.id).order("created_at DESC").page(params[:page])
  end

  def edit
    if current_user?(@user)
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
    @permitted_requests = Request.where(user_id: current_user.id).where(status: 1)
  end

  def mentee
    @permit_requests = Request.where(to_id: current_user.id).where(status: 1)
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

  def move_to_login
    redirect_to new_user_registration_path, alert: 'ログインまたは新規登録をお願いします' if !user_signed_in?
  end

  def check_user
    redirect_to new_user_registration_path, alert: 'ログインまたは新規登録をお願いします' if !current_user?(@user)
  end
end
