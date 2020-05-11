class MessagesController < ApplicationController

  def index
    @sent_messages = Message.where(user_id: current_user).order("created_at DESC").page(params[:page]).per(6)
    @recieved_messages = Message.where(to_id: current_user).order("created_at DESC").page(params[:page]).per(6)
  end
  
  def create
    message = Message.create(message_params)
    user = User.find_by(id: message.user.id)
    if message.save
      redirect_to user_messages_path(user.id), notice: 'メッセージを送信しました'
    else
      redirect_to root_path, alert: 'メッセージが送信できませんでした'
    end
  end
  
  def show
    @respond_message = Message.find(params[:id])
    @message = Message.new
  end


  private
  def message_params
    params.require(:message).permit(:content, :to_id).merge(user_id: current_user.id)
  end

end
