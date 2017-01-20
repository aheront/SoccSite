require 'rails_helper'

RSpec.describe Post, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  describe Post do
    before(:all) do
      @user = User.new()
      @post = @user.posts.new(:name=>'name', :text=>'text')
    end

    it 'has a post_text' do
      @post.text.should eq 'text'
    end


    it 'has an post_name' do
      @post.name.should eq 'name'
    end
    it 'post include user' do
      @post.save
      @user.posts.should include(@post)
    end
  end
end
