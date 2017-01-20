require 'rails_helper'

RSpec.describe Message, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  describe Message do
    before(:all) do
      @user = User.new()
      @user_from = User.new()
      @message = Message.new(:user=>@user,:user_from=>@user_from.id, :message_text=>'qwetrt')
    end

    it 'has a message_text' do
      @message.message_text.should eq 'qwetrt'
    end


    it 'has an user' do
      @message.user.should be @user
    end

    it 'has an user_from' do
      @message.user_from.should be @user_from.id
    end
  end
  end
