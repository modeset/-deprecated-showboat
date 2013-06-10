$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "showboat/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "showboat"
  s.version     = Showboat::VERSION
  s.authors     = ["Mode Set"]
  s.email       = ["info@modeset.com"]
  s.homepage    = "https://github.com/modeset/showboat"
  s.summary     = "Presentation master slides for Mode Set, built on top of Reveal.js."
  s.description = "Presentation master slides for Mode Set, built on top of Reveal.js."

  s.files = Dir["{app,config,db,lib,vender}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails"
  s.add_dependency "haml-rails", "~> 0.3.2"
  s.add_dependency "sass-rails"
  s.add_dependency "bourbon"
  s.add_dependency "modicon"
  s.add_dependency "coffee-rails"
  s.add_dependency "underscore-rails"
  s.add_dependency "redcarpet"

  # Used by the dummy application
  s.add_development_dependency "sqlite3"
end

