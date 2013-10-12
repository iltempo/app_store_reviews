require 'spec_helper'

module AppStoreReviews
  describe App do
    subject { App }

    it 'has an id' do
      expect(subject.new(123).id).to eq(123)
    end
  end
end
