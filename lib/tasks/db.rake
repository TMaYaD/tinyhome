# frozen_string_literal: true

namespace :db do
  desc 'Truncate all tables'
  task truncate: :environment do
    conn = ActiveRecord::Base.connection
    tables = conn.tables
    tables.delete 'schema_migrations'
    tables.each { |t| conn.execute("TRUNCATE #{t}") }
  end
end
