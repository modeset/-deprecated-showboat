require 'sass-rails'
require 'bourbon'
require "modicon"
require 'coffee-rails'
require 'underscore-rails'
require "haml-rails"
require "redcarpet"

module Showboat
  class Engine < ::Rails::Engine
    isolate_namespace Showboat
  end
end
