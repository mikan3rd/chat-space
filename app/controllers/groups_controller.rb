class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_group_params, only: [:edit, :update]

  def index
    @groups = current_user.groups.order(id: :DESC)
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      respond_to do |format|
        format.html { redirect_to root_path, notice: "グループを作成しました" }
        format.json
      end
    else
      flash.now[:alert] = "グループ名を入力してください"
      render :new
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to group_messages_path(@group), notice: "グループを編集しました"
    else
      flash.now[:alert] = "グループ名を入力してください"
      render :edit
    end
  end

  def search
    @users = User.where('name LIKE(?)', "%#{params[:name]}%")
    render json: @users
  end

  private

  def group_params
    user_ids = params[:group]["user_ids"]
    user_ids << current_user.id.to_s
    params.require(:group).permit(:name, user_ids: [])
  end

  def find_group_params
    @group = Group.find(params[:id])
  end
end
