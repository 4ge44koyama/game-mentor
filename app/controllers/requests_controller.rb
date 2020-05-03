class RequestsController < ApplicationController

  def new
  end

  def create
    @request = Request.create(request_params)
    if @request.save
      redirect_to root_path
    else
      redirect_to post_path
    end  
  end

  private
  def request_params
    params.require(:request).permit(:text).merge(user_id: current_user.id, to_id: params[:user_id], status:)
  end
end
