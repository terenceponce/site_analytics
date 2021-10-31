# frozen_string_literal: true

require 'site_analytics/parser'

RSpec.describe SiteAnalytics::Parser do
  describe '#execute' do
    it 'processes the page view entries' do
      root_dir = File.dirname(File.expand_path('..', __dir__))
      parser = described_class.new(File.path("#{root_dir}/support/fixtures/webserver.log"))

      expect(parser.execute).to eq(true)
    end
  end
end
