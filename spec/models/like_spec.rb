require 'rails_helper'

RSpec.describe Like, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe Post do
    before(:all) do
      @user = User.new()
      @post = @user.posts.new(:name=>'name', :text=>'text')
      @photo = @user.photos.new()
      @like_post = @post.likes.new
      @like_photo = @photo.likes.new
    end

    it 'has post a like' do
      @post.likes.should include(@like_post)
    end


    it 'has photo a like' do
      @photo.likes.should include(@like_photo)
    end
  end
end
