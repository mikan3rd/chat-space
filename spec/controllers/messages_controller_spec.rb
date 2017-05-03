require 'rails_helper'

describe MessagesController do
  let(:user) { create(:user) }

  describe 'GET #index' do
    before do
      @groups = user.groups.order(created_at: :DESC)
      @group = user.groups.first
      @users = @group.users
      @messages = @group.messages.order(created_at: :DESC).includes(:user)
      # controller.stub(:index_variables).and_return(true)
    end

    it "ログインしていない場合のビュー" do
      get :index, group_id: @group.id
      expect(response).to redirect_to(new_user_session_path)
    end

    it "ログインしている場合のビュー" do
      login_user user
      get :index, group_id: @group.id
      expect(response).to render_template :index
    end
  end

  describe 'POST #create' do
    before do
      @groups = user.groups.order(created_at: :DESC)
      @group = user.groups.first
      @users = @group.users
      @messages = @group.messages.order(created_at: :DESC).includes(:user)
    end

    it "ログインしていない場合のビュー" do
      post :create, group_id: @group.id, message: attributes_for(:message)
      expect(response).to redirect_to(new_user_session_path)
    end

    it "ログインしている場合のビュー" do
      login_user user
      post :create, group_id: @group.id, message: attributes_for(:message)
      expect(response).to redirect_to(group_messages_path)
    end
  end
end
