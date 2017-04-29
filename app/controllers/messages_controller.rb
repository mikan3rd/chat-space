class MessagesController < ApplicationController
  before_action :authenticate_user!
  def index
    @groups = Group.order(id: :DESC)
  end
end
