module Showboat
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc 'Install the base assets for setting up a showboat presentation.'
      source_root File.expand_path('../templates', __FILE__)

      def cleanup_rails
        remove_file "app/assets/stylesheets/application.css"
        remove_file "app/assets/javascripts/application.js"
        remove_file "app/assets/images/rails.png"
        remove_file "README.rdoc"
        remove_dir "app/helpers"
        remove_dir "app/mailers"
        remove_dir "app/models"
        remove_file "app/views/layouts/application.html.erb"
        remove_dir "doc"
        remove_dir "lib"
        remove_dir "public"
        remove_dir "test"
        remove_dir "vendor/assets"
      end

      def create_style_file
        create_file "app/assets/stylesheets/application.sass", "@import showboat"
      end

      def create_behavior_file
        copy_file "application.coffee", "app/assets/javascripts/application.coffee"
      end

      def create_markup_files
        copy_file "application.html.haml", "app/views/layouts/application.html.haml"
        empty_directory "app/views/showboat"
        copy_file "index.html.haml", "app/views/showboat/index.html.haml"
        create_file "README.md", "# Showboat Presentation"
      end

      def create_controller_and_route
        copy_file "showboat_controller.rb", "app/controllers/showboat_controller.rb"
        copy_file "routes.rb", 'config/routes.rb'
      end

      def create_public_dir
        directory "public", "public"
      end

    end
  end
end

