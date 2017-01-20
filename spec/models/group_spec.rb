require 'rails_helper'

RSpec.describe Group, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  describe Group do
    before(:all) do
      @user = User.new()
      @photo=Photo.new
      @group = Group.new(:name=>'qwetrt',:photo=>@photo)
    end

    it 'has a name' do
      @group.name.should eq 'qwetrt'
    end
    it 'has a photo' do
      @group.photo.should eq @photo
    end
  end
end
