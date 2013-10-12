$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'app_store_reviews'
require 'fakeweb'

FakeWeb.allow_net_connect = false

reviews_uri ='https://itunes.apple.com/WebObjects/MZStore.woa/wa/userReviewsRow?id=12345&displayable-kind=11&startIndex=0&endIndex=100&sort=4&appVersion=all'
FakeWeb.register_uri(:get, reviews_uri, :body => open('spec/fixtures/reviews.json', &:read))
