$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "travis_play/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "travis_play"
  s.version     = TravisPlay::VERSION
  s.authors     = ["scieslak"]
  s.email       = ["scieslak@scieslak.com"]
  s.homepage    = "http://scieslak.com"
  s.summary     = "Summary of TravisPlay."
  s.description = "Description of TravisPlay."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.0", ">= 5.0.0.1"

  s.add_development_dependency "sqlite3"
end
