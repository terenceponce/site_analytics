# frozen_string_literal: true

require 'site_analytics/model/page'

module SiteAnalytics
  module Service
    # Service class for reading/manipulating Page data
    class Page
      LIST_QUERY = 'SELECT pages.url, COUNT(views.id) AS PageViews, '\
                   'COUNT(DISTINCT views.ip_address) AS UniqueViews '\
                   'FROM pages INNER JOIN views ON pages.id = views.page_id '\
                   'GROUP BY pages.id ORDER BY PageViews DESC'

      def self.list_pages
        DB.fetch(LIST_QUERY).map do |result|
          {
            url: result[:url],
            unique_views: result[:UniqueViews],
            page_views: result[:PageViews]
          }
        end
      end

      def self.get_page(url)
        SiteAnalytics::Model::Page.where(url: url).first
      end

      def self.create_page(url)
        SiteAnalytics::Model::Page.find_or_create(url: url)
      end
    end
  end
end
