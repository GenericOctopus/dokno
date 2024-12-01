require 'rails/generators'
require 'rails/generators/migration'

module Dokno
  module Generators
    class MigrationGenerator < Rails::Generators::Base
      include Rails::Generators::Migration

      source_root File.expand_path('../templates', __dir__)

      desc 'Copies Dokno migrations to your application'

      def self.next_migration_number(dirname)
        next_migration_number = current_migration_number(dirname) + 1
        ActiveRecord::Migration.next_migration_number(next_migration_number)
      end

      def copy_migrations
        migration_template 'migrations/dokno.rb', 'db/migrate/create_dokno_tables.rb'
      end
    end
  end
end
