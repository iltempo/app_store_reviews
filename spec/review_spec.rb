require 'spec_helper'

module AppStoreReviews
  describe Review do
    let(:opts) { { :app_id => 12345, :store_id => 9876 } }
    subject { AppStoreReviews.get(opts).first }

    it 'should have the user_review_id' do
      expect(subject.user_review_id).to eq('121212121')
    end

    it 'should have the title' do
      expect(subject.title).to eq('Great update')
    end

    it 'should have the user name' do
      expect(subject.name).to eq('one_user')
    end

    it 'should have the text' do
      expect(subject.body).to eq('Nice one.')
    end

    it "should report the rating" do
      expect(subject.rating).to eq(5)
    end

    it "should report the vote count" do
      expect(subject.vote_count).to eq(8)
    end

    it "should report the vote sum" do
      expect(subject.vote_sum).to eq(9)
    end

    it "should report the date" do
      expect(subject.date.to_date).to eq(Date.new(2013, 9, 18))
    end
  end
end
