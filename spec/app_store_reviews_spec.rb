require 'spec_helper'

describe AppStoreReviews do
  let(:opts) { { :app_id => 12345, :store_id => 9876 } }
  subject(:reviews) { AppStoreReviews.get(opts) }

  it 'should have a version number' do
    expect(AppStoreReviews::VERSION).to_not be_nil
  end

  it 'should return correct number of reviews' do
    expect(subject.length).to eq(2)
  end
end
