# frozen_string_literal: true

require 'site_analytics/migrator'
require 'site_analytics/parser'

# This processes the file that was passed and orchestrates
# the different operations needed to analyze the data
module SiteAnalytics
  def self.execute(file)
    migrator = SiteAnalytics::Migrator.new
    migrator.create
    SiteAnalytics::Parser.new(file).execute
  end
end
