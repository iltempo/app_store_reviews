# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'app_store_reviews/version'

Gem::Specification.new do |spec|
  spec.name          = 'app_store_reviews'
  spec.version       = AppStoreReviews::VERSION
  spec.author        = 'Alexander Greim'
  spec.email         = 'alexxx@iltempo.de'
  spec.summary       = 'Fetching and syncing app store reviews'
  spec.description   = <<-EOF
    Ruby library for fetching and syncing app store reviews via iTunes json
    protocol.
  EOF
  spec.homepage      = 'https://github.com/iltempo/app_store_reviews'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^spec/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'httparty', '~> 0.13'
  spec.add_runtime_dependency 'nokogiri', '~> 1.6'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake', '~> 10.4'
  spec.add_development_dependency 'rspec', '~> 3.1'
  spec.add_development_dependency 'fakeweb', '~> 1.3'
end
