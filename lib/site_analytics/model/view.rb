# frozen_string_literal: true

require 'sequel'

module SiteAnalytics
  module Model
    # View model
    class View < Sequel::Model
      many_to_one :page
    end
  end
end
