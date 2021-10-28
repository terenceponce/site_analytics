# frozen_string_literal: true

require 'sequel'

module SiteAnalytics
  # Class for performing database migrations
  class Migrator
    def initialize(opts = {})
      @db = if opts && opts[:env] == :test
              Sequel.connect('sqlite://test-database.db')
            else
              Sequel.connect('sqlite://database.db')
            end
    end

    def create
      create_pages_table
      create_views_table
    end

    def destroy
      @db.drop_table :views
      @db.drop_table :pages
    end

    private

    def create_pages_table
      return if @db.table_exists?(:pages)

      @db.create_table :pages do
        primary_key :id
        String :url
      end
    end

    def create_views_table
      return if @db.table_exists?(:views)

      @db.create_table :views do
        primary_key :id
        String :ip_address
        foreign_key :page_id, :pages
      end
    end
  end
end
