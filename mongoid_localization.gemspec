$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mongoid_localization/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mongoid_localization"
  s.version     = MongoidLocalization::VERSION
  s.authors     = ["David Krett"]
  s.email       = ["david@what2do.asia"]
  s.homepage    = "https://github.com/dbkbali/mongoid_localization"
  s.summary     = "Adds reader and writer methods to allow access to mongoid translations for mongoid ~> 2.3.3"
  s.description = "Simple gem that adds reader and writer methods to a mongoid document to write and access translations when :localize has been set to true for a field"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.1.1"
  s.add_runtime_dependency "mongo", "1.3"
  s.add_runtime_dependency "bson_ext", "1.3"
  s.add_development_dependency "mongoid", "~> 2.3.3"
  s.add_development_dependency "mongo", "~> 1.3"
  s.add_development_dependency "bson_ext", "~> 1.3"
end
