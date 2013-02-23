module Showboat
  module Generators
    class SlideGenerator < Rails::Generators::NamedBase

      class_option :no_js,  :type => :boolean
      class_option :no_css, :type => :boolean

      desc 'Appends the markup for a given slide template'
      # source_root File.expand_path('../templates', __FILE__)

      def add_slide_to_presentation
        haml = ''
        if file_name == "title"
          haml = <<-HAML
%section.title-template(data-state="no-background")
  %h1 Mode Set
  %h2 Presentation Name
  %h2 Continued or presenter
  %date= Time.zone.now.strftime "%m.%d.%Y"
  = image_tag "showboat/title-smoke.png", alt: "mode set", class: "smoke"
  .slant
  %div.modeset-logo

  %aside.notes
    talk fast

          HAML

        elsif file_name == "copy"
          haml = <<-HAML
%section.copy-template(data-heading="Copy Template <span>sub heading</span>")
  :markdown
    # The copy template

          HAML

        elsif file_name == "list"
          haml = <<-HAML
%section.list-template(data-heading="List Template <span>sub heading</span>")
  :markdown
    - a list item
    - another list item

          HAML

        elsif file_name == "fragment"
          haml = <<-HAML
%section.list-template(data-heading="List Template <span>sub heading</span>")
  %h1 Fragments
  %ul
    %li.fragment.fade-in A fragment
    %li.fragment.fade-in Another fragment

          HAML

        elsif file_name == "media"
          haml = <<-HAML
%section.media-template(data-heading="Media Template <span>Project Name</span>" data-link="Example.com" data-src="http://www.modeset.com")
  = image_tag "showboat/fpo/fpo-tablet-handheld-laptop.png", alt: "fpo", class: "reflect"

          HAML

        elsif file_name == "end"
          haml = <<-HAML
%section.end-template
  %h1 thank you
  .slant
  %div.modeset-logo

          HAML
        end

        if haml.empty?
          puts "#{file_name} template not found."
          puts "Available templates are: title, copy, list, fragment, media, end"
        else
          File.open("app/views/showboat/index.html.haml", 'a') {|f| f.write(haml) }
          puts "#{file_name} template appended to app/views/showboat/index.html.haml"
        end
      end

    end
  end
end

