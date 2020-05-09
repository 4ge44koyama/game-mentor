class RequestsController < ApplicationController

  def index
    @requested_lists = Request.where(to_id: current_user.id)
    @request_lists = Request.where(user_id: current_user.id)
  end

  def create
    request = Request.create(request_params)
    post = Post.find_by(user_id: request.to_id)
    if request.save
      redirect_to post_path(post.id), notice: 'リクエストが完了しました'
    else
      redirect_to post_path(post.id), alert: 'リクエストができませんでした'
    end
  end

  def update
    request = Request.find_by(params[:id])
    if request.update(status: 1)
      redirect_to user_requests_path(current_user), notice: 'リクエストを承認しました'
    else
      redirect_to user_requests_path(current_user), alert: 'リクエストの承認に失敗しました'
    end
  end

  def destroy
    request = Request.find(params[:id])
    post = Post.find_by(user_id: request.to_id)
    if request.destroy
      redirect_to post_path(post.id), notice: 'リクエストの取り消しが完了しました'
    else
      redirect_to post_path(post.id), alert: 'リクエストの取り消しができませんでした'
    end
  end

  private

  def request_params
    params.require(:request).permit(:to_id, :status).merge(user_id: current_user.id)
  end

end
