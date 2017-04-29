class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @group = Group.new
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
