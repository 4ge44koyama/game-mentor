class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]
  
  def index
    @posts = Post.includes(:user)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to post_path @post
    else
      redirect_to new_post_path
    end  
  end

  def show
    if user_signed_in?
    else
      redirect_to new_user_registration_path
    end
  end

  def edit
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post.id)
  end

  def destroy
    if @a_post.destroy
      redirect_to root_path, notice: '商品情報を削除しました'
    else
      render :show, notice: '商品情報が削除できませんでした'
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :fee).merge(user_id: current_user.id)
  end

  def set_post
    @a_post = Post.find(params[:id])
  end

end
