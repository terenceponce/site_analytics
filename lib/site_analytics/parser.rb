# frozen_string_literal: true

require 'site_analytics/service/page'
require 'site_analytics/service/view'

module SiteAnalytics
  # Parses each line from the given file and converts it into
  # a more readable format for our other classes to use.
  class Parser
    def initialize(file_path)
      @file_path = file_path
    end

    def execute
      File.foreach(@file_path) do |line|
        entry = line.split

        page = SiteAnalytics::Service::Page.create_page(entry[0])
        SiteAnalytics::Service::View.create_view(page, entry[1])
      end

      true
    end
  end
end
