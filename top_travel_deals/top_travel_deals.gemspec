
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "top_travel_deals/version"

Gem::Specification.new do |spec|
  spec.name          = "top_travel_deals"
  spec.version       = TopTravelDeals::VERSION
  spec.authors       = ["'Carol Greene'"]
  spec.email         = ["'carolgreene3@gmail.com'"]

  spec.summary       = "Top 20 Travel Deals"
  spec.description   = "Provides details from Travelzoo's Top 20 Travel Deals for the week."
  spec.homepage      = 'http://rubygems.org/gems/top_travel_deals'
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = ["cli-data-gem-assessment-v-000/top_travel_deals"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "nokogiri", ">= 0"
  spec.add_development_dependency "pry", ">= 0"

end
