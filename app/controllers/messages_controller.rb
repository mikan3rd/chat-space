class MessagesController < ApplicationController
  before_action :authenticate_user!
  def index
    @groups = Group.order(id: :DESC)
    @group = Group.find(params[:group_id])
  end
end
