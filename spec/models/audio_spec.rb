require 'rails_helper'

RSpec.describe Audio, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe Audio do

    before(:all) do
      @audio = Audio.new(:source=>User.new)
    end

    it 'source_audio not has a nil' do
      @audio.source.should_not be_nil
    end

    it 'audio include list' do
      @audio.save
      Audio.all.should include(@audio)
    end

  end
end
