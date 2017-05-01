class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = Group.order(id: :DESC)
    @group = Group.find(params[:group_id])
    @users = @group.users

    if @users.ids.include?(current_user.id)
      @messages = @group.messages.order(id: :DESC).includes(:user)
      @message = Message.new
    else
      redirect_to root_path
    end
  end

  def create
    @message = current_user.messages.new(message_params)

    if @message.save
      redirect_to group_messages_path(params[:group_id]), notice: "メッセージを投稿しました"
    else
      flash.now[:alert] = "メッセージを入力してください"
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id])
  end
end
