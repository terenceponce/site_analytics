# frozen_string_literal: true

require 'site_analytics/model/view'

module SiteAnalytics
  module Service
    # Service class for manipulating View data
    class View
      def self.create_view(page, ip_address)
        SiteAnalytics::Model::View.create(page_id: page.id, ip_address: ip_address)
      end
    end
  end
end
