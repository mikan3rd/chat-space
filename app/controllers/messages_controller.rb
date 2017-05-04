class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :index_variables, only: [:index, :create]

  def index
    if @users.ids.include?(current_user.id)
      @message = Message.new
    else
      flash.now[:alert] = "このグループの参加者ではありません"
      redirect_to root_path
    end
  end

  def create
    @message = current_user.messages.new(message_params)

    if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path(params[:group_id]), notice: "メッセージを投稿しました" }
        format.json { render json: @message }
      end
    else
      flash.now[:alert] = "メッセージを入力してください"
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id])
  end

  def index_variables
    @groups = current_user.groups.order(created_at: :DESC)
    @group = Group.find(params[:group_id])
    @users = @group.users
    @messages = @group.messages.order(created_at: :DESC).includes(:user)
  end
end
