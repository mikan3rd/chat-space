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
    Group.create(group_params)
    redirect_to root_path

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
