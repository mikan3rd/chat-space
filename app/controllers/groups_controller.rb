class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = Group.order(id: :DESC)
  end

  def new
    @group = Group.new
  end

  def create
    group = Group.new(group_params)
    if group.save == false
      flash[:alert] = "グループ名を入力してください"
      @group = group
      render :new
    else
      flash[:notice] = "グループを作成しました"
      redirect_to root_path
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    group = Group.find(params[:id])
    if group.update(group_params) == false
      flash[:alert] = "グループ名を入力してください"
      @group = group
      render :edit
    else
      flash[:notice] = "グループを編集しました"
      redirect_to "/groups/#{group.id}/messages"
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end
end
