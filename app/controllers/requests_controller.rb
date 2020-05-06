class RequestsController < ApplicationController

  def create
    request = Request.create(request_params)
    post = Post.find_by(user_id: request.to_id)
    if request.save
      redirect_to post_path(post.id), notice: 'リクエストが完了しました'
    else
      redirect_to post_path(post.id), alert: 'リクエストができませんでした'
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
