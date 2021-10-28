# frozen_string_literal: true

require 'site_analytics/parser'

# This processes the file that was passed and orchestrates
# the different operations needed to analyze the data
module SiteAnalytics
  def self.execute(file)
    SiteAnalytics::Parser.new(file).execute
  end
end
