# frozen_string_literal: true

require 'site_analytics/parser'

RSpec.describe SiteAnalytics::Parser do
  let(:expected_result) do
    {
      '/about' => 81,
      '/about/2' => 90,
      '/contact' => 89,
      '/help_page/1' => 80,
      '/home' => 78,
      '/index' => 82
    }
  end

  describe '#execute' do
    it 'processes the page view entries' do
      root_dir = File.dirname(File.expand_path('..', __dir__))
      parser = described_class.new(File.path("#{root_dir}/support/fixtures/webserver.log"))

      expect(parser.execute).to eq(expected_result)
    end
  end
end
