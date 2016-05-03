require 'coveralls'
Coveralls.wear! if ENV['CI']
require 'fakeweb'
require 'app_store_reviews'

FakeWeb.allow_net_connect = %r{^https://coveralls\.io/api}

reviews_uri = 'https://itunes.apple.com/WebObjects/MZStore.woa/wa/userReviewsRow?id=12345&displayable-kind=11&startIndex=0&endIndex=100&sort=4&appVersion=all'
FakeWeb.register_uri(:get, reviews_uri,
                     body: open('spec/fixtures/reviews.json', &:read))
