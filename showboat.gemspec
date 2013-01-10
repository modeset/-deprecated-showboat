$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "showboat/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "showboat"
  s.version     = Showboat::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Showboat."
  s.description = "TODO: Description of Showboat."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 3.2.10"
  s.add_dependency "haml-rails"
  s.add_dependency "sass-rails"
  s.add_dependency "bourbon"
  s.add_dependency "coffee-rails"
  s.add_dependency "underscore-rails"
  s.add_dependency "redcarpet"
  s.add_development_dependency "sqlite3"
end
