$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mongoid_localization/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mongoid_localization"
  s.version     = MongoidLocalization::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of MongoidLocalization."
  s.description = "TODO: Description of MongoidLocalization."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.1.1"

  s.add_development_dependency "mongoid", "~> 2.3.3"
end
