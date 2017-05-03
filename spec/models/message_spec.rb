require 'rails_helper'

describe Message do

  describe '#create' do

    it "is invalid without a body" do
      message = build(:message, body: nil)
      message.valid?
      expect(message.errors[:body]).to include("を入力してください")
    end

    it "is valid with a body that has more than 1 characters" do
      message = build(:message, body: "a")
      expect(message).to be_valid
  end

  end
end
