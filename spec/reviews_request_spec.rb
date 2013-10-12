require 'spec_helper'

module AppStoreReviews
  describe ReviewsRequest do
    let(:app) { App.new(12345) }
    let(:store) { Store.new(9876) }
    subject { ReviewsRequest.new(store, app, 100) }

    it 'returns json' do
      expect(JSON.parse(subject.run)).to_not be_empty
    end
  end
end
