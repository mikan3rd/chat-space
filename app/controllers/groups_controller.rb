class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = Group.order(id: "DESC")
  end

  def new
    @group = Group.new
  end

  def create
    group = Group.new(group_params)
    unless group.save
      flash[:alert] = "グループ名を入力してください"
      @group = group
      render :new
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
    params.require(:group).permit(:name, user_ids: [])
  end
end
