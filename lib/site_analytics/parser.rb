# frozen_string_literal: true

module SiteAnalytics
  # Parses each line from the given file and converts it into
  # a more readable format for our other classes to use.
  class Parser
    def initialize(file_path)
      @file_path = file_path
    end

    def execute
      page_views = {}

      File.foreach(@file_path) do |line|
        entry = line.split

        page_views[entry[0]] = if page_views.key?(entry[0])
                                 page_views[entry[0]] + 1
                               else
                                 1
                               end
      end

      page_views
    end
  end
end
