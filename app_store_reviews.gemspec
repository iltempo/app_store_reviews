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

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.test_files    = spec.files.grep(%r{^spec/})

  spec.add_runtime_dependency 'httparty', '~> 0.13'
  spec.add_runtime_dependency 'nokogiri', '~> 1.6'

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'fakeweb', '~> 1.3'
end
