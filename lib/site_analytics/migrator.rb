# frozen_string_literal: true

module SiteAnalytics
  # Class for performing database migrations
  class Migrator
    def self.create
      create_pages_table
      create_views_table
    end

    def self.destroy
      DB.drop_table :views
      DB.drop_table :pages
    end

    def self.create_pages_table
      return if DB.table_exists?(:pages)

      DB.create_table :pages do
        primary_key :id
        String :url

        index :url, unique: true
      end
    end

    def self.create_views_table
      return if DB.table_exists?(:views)

      DB.create_table :views do
        primary_key :id
        String :ip_address
        foreign_key :page_id, :pages

        index :ip_address
        index :page_id
      end
    end
  end
end
