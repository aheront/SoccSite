require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  describe User do
    before(:all) do
      @user = User.new(:email=>'example@example.ex',:first_name=>'david',:last_name=>'dady',
                      :photo_id=>5)
    end

    it 'has a first_name' do
      @user.first_name.should eq 'david'
    end


    it 'has a last_name' do
      @user.last_name.should eq 'dady'
    end

    it 'has a unique user' do
      User.all.should_not include(@user)
    end
    it 'has a photo_id' do
      @user.photo_id.should eq 5
    end
  end
end
