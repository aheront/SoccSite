require 'rails_helper'

RSpec.describe Video, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  
  describe Video do
    before(:all) do
      @video = Video.new(:source=>User.new)
    end

    it 'source_video not has a nil' do
      @video.source.should_not be_nil
    end

    it 'video include list' do
      @video.save
      Video.all.should include(@video)
    end
  end
end
