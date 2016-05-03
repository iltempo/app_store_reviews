require 'spec_helper'

module AppStoreReviews
  describe Store do
    subject { Store }

    it 'has an id' do
      expect(subject.new(123).id).to eq(123)
    end

    it 'raises if store is not known' do
      expect { subject.new('Andorra') }.to raise_error(UnknownStore)
    end

    it 'can be initialized with a country name' do
      expect(subject.new('United States').id).to eq(143_441)
    end
  end
end
