module AppStoreReviews
  # Wraps review data into a class
  class Review < OpenStruct
    def self.new_from_result(data)
      new.tap do |review|
        review.user_review_id = data['userReviewId']
        review.title          = data['title']
        review.body           = AppStoreReviews.strip_html(data['body'])
        review.name           = data['name']
        review.rating         = data['rating']
        review.vote_count     = data['voteCount']
        review.vote_sum       = data['voteSum']
        review.date           = Time.parse(data['date'])
      end
    end

    def self.all_from_json(json)
      results = JSON.parse(json)
      results['userReviewList'].map do |result|
        new_from_result(result)
      end
    end
  end
end
