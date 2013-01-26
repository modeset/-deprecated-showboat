module Showboat
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc 'Install the base assets for setting up a showboat presentation.'
      source_root File.expand_path('../../../../../spec/dummy', __FILE__)

      def cleanup_rails
        remove_file "README.rdoc"
        remove_dir "app/assets"
        remove_dir "app/controllers"
        remove_dir "app/helpers"
        remove_dir "app/mailers"
        remove_dir "app/models"
        remove_dir "app/views"
        remove_dir "doc"
        remove_dir "lib"
        remove_dir "public"
        remove_dir "test"
        remove_dir "vendor/assets"
      end

      def copy_directories
        directory "app/assets"
        directory "app/controllers"
        directory "app/views"
        directory "public", "public"
      end

      def copy_files
        copy_file "config/routes.rb"
        copy_file "README.md"
      end
    end
  end
end

