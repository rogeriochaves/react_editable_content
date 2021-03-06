require 'rails/generators/active_record'

module EditableContent
  module Generators
    class InstallGenerator < ActiveRecord::Generators::Base
      desc "Installs Editable Contents and generates the necessary migrations"
      argument :name, type: :string, default: "editables"
      
      source_root File.expand_path("../templates", __FILE__)

      def create_migrations
        migration_template 'create_editable_content_editables.rb', 'db/migrate/create_editable_content_editables.rb'
        migration_template 'create_mercury_images.rb', 'db/migrate/create_mercury_images.rb'
      end

      def install_authentication
        copy_file 'lib/mercury/authentication.rb'
      end

    end
  end
end