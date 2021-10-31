# frozen_string_literal: true

require 'factory_bot'
require 'site_analytics/model/page'

FactoryBot.define do
  factory :page, class: 'SiteAnalytics::Model::Page' do
    to_create(&:save)

    sequence :url do |n|
      "/home/#{n}"
    end
  end

  factory :view, class: 'SiteAnalytics::Model::View' do
    to_create(&:save)

    association :page
    sequence :ip_address do |n|
      "192.168.1.#{n}"
    end
  end
end
