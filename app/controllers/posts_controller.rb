class PostsController < ApplicationController
  include PostsHelper
  before_action :move_to_login, except: :index
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post.includes(:user).order("created_at DESC").page(params[:page])
  end

  def new
    if Post.find_by(user_id: current_user.id).nil?
      @post = Post.new
    else
      redirect_to edit_post_path(current_user.post.id), method: :get, alert: '投稿は1人につき1件です'
    end
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to post_path @post, notice: '投稿が完了しました'
    else
      redirect_to new_post_path, alert: '投稿が保存できませんでした'
    end
  end

  def show
    @search_request = Request.find_by(user_id: current_user.id, to_id: @a_post.user_id)
    @request = Request.new
    @message = Message.new
  end

  def edit
    redirect_to new_user_registration_path, alert: 'ログインをお願いします' if !current_user_post?(@a_post)
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post.id), notice: '変更を保存しました'
  end

  def destroy
    redirect_to new_user_registration_path, alert: 'ログインをお願いします' if !current_user_post?(@a_post)
    if @a_post.destroy
      redirect_to root_path, notice: '投稿を削除しました'
    else
      render :show, notice: '投稿が削除できませんでした'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :fee, :tag_list).merge(user_id: current_user.id)
  end

  def set_post
    @a_post = Post.find(params[:id])
  end

  def move_to_login
    redirect_to new_user_registration_path, alert: 'ログインまたは新規登録をお願いします' if !user_signed_in?
  end
end
