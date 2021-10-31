# frozen_string_literal: true

require 'site_analytics/migrator'
require 'site_analytics/parser'
require 'site_analytics/service/page'

# This processes the file that was passed and orchestrates
# the different operations needed to analyze the data
module SiteAnalytics
  def self.execute(file)
    SiteAnalytics::Migrator.destroy
    SiteAnalytics::Migrator.create
    SiteAnalytics::Parser.new(file).execute
    SiteAnalytics::Service::Page.list_pages
  end
end
