# frozen_string_literal: true

require 'sequel'

module SiteAnalytics
  module Model
    # Page model
    class Page < Sequel::Model
      one_to_many :views
    end
  end
end
