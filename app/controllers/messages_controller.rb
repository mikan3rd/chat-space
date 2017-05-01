class MessagesController < ApplicationController
  before_action :authenticate_user!
  def index
    @groups = Group.order(id: :DESC)
    @group = Group.find(params[:group_id])
    @users = @group.users
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to group_messages_path(params[:group_id]), notice: "メッセージを投稿しました"
    else
      flash[:alert] = "メッセージを入力してください"
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end
end
