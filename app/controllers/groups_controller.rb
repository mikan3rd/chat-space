class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = Group.order("updated_at DESC")
  end

  def new
    @group = Group.new
    @users = User.all
  end

  def create
    group = Group.create(group_params)
    if group.name == ""
      flash[:alert] = "グループ名を入力してください"
      redirect_to "/groups/new"
    else
      redirect_to root_path
    end
  end

  def edit
  end

  def update
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end

end
