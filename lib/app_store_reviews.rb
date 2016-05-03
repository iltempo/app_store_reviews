require 'ostruct'
require 'json'
require 'bundler/setup'
require 'httparty'
require 'nokogiri'

require 'app_store_reviews/version'
require 'app_store_reviews/stores'
require 'app_store_reviews/store'
require 'app_store_reviews/app'
require 'app_store_reviews/review'
require 'app_store_reviews/reviews_request'

# Top level module for App Store Reviews gem
module AppStoreReviews
  def self.get(opts)
    store = Store.new(opts[:store])
    app = App.new(opts[:app_id])
    json = ReviewsRequest.new(store, app, opts[:limit] || 100).run
    Review.all_from_json(json)
  end

  def self.strip_html(str)
    doc = Nokogiri::HTML.parse(str)
    doc.css('br').each { |node| node.replace("\n") }
    doc.text
  end
end
