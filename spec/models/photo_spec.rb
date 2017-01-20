require 'rails_helper'

RSpec.describe Photo, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  describe Photo do
    before(:all) do
      @user = User.new()
      @photo = @user.photos.new(:image=>nil)
    end

    it 'has an image' do
      @photo.image.should_not be_nil
    end

    it 'has photo a user' do
      @user.photos.should include(@photo)
    end
  end
end
