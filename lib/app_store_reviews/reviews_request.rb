module AppStoreReviews
  # HTTP request class for reviews to iTunes
  class ReviewsRequest
    include HTTParty
    base_uri 'https://itunes.apple.com'

    def initialize(store, app, limit)
      @store = store
      @app = app
      @limit = limit
      set_headers
    end

    def run
      self.class.get(uri_path).body
    end

    private

    def uri_path
      ''.tap do |url|
        url << '/WebObjects/MZStore.woa/wa/userReviewsRow'
        url << "?id=#{@app.id}"
        url << '&displayable-kind=11'
        url << '&startIndex=0'
        url << "&endIndex=#{@limit}"
        url << '&sort=4'
        url << '&appVersion=all'
      end
    end

    def set_headers
      self.class.headers(
        'User-Agent' => 'iTunes/11.1 (Macintosh; OS X 10.9) AppleWebKit/537.71',
        'X-Apple-Store-Front' => "#{@store.id}-2,17"
      )
    end
  end
end
