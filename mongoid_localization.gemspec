$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mongoid/localization/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mongoid_localization"
  s.version     = Mongoid::Localization::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["David Krett"]
  s.email       = ["david@what2do.asia"]
  s.homepage    = "https://github.com/dbkbali/mongoid_localization"
  s.summary     = "Adds reader and writer methods to allow access to mongoid translations for mongoid ~> 2.3.3"
  s.description = "Simple gem that adds reader and writer methods to a mongoid document to write and access translations when :localize has been set to true for a field"

  s.files = Dir.glob("lib/**/*") + %w(MIT-LICENSE README.rdoc)
  s.test_files = Dir.glob("spec/**/*")
  #s.add_dependency "rails", "~> 3.1"
  s.add_dependency "mongoid", "~> 2.4"
  s.add_development_dependency "mongoid", "~> 2.3.3"
  s.add_development_dependency "mongo", "~> 1.3"
end
