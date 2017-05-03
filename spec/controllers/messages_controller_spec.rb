require 'rails_helper'

describe MessagesController do
  let(:user) { create(:user) }

  describe 'GET #index' do
    before do
      login_user user
      # controller.stub(:index_variables).and_return(true)
    end

    it "@groupsの確認" do
      @group = user.groups.first
      @users = @group.users
      @messages = @group.messages.order(created_at: :DESC).includes(:user)
      get :index, group_id: @group.id
      create_list(:group, 3)
      groups = user.groups
      expect(assigns(:groups)).to match(groups.sort{ |a, b| b.created_at <=> a.created_at })
    end

    it "@groupの確認" do
    end

    it "@usersの確認" do
    end

    it "@messagesの確認" do
    end

    it "@messageの確認" do
    end

    it "ビューに移動するかの確認" do
    #   group = create(:group)
    #   user = create_list(:user, 3)
    #   get :index, group_id: group
    #   expect(response).to render_template :index
    end
  end
end
