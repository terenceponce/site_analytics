# frozen_string_literal: true

require 'site_analytics'

RSpec.describe SiteAnalytics do
  let(:expected_result) do
    [
      { page_views: 90, unique_views: 22, url: '/about/2' },
      { page_views: 89, unique_views: 23, url: '/contact' },
      { page_views: 82, unique_views: 23, url: '/index' },
      { page_views: 81, unique_views: 21, url: '/about' },
      { page_views: 80, unique_views: 23, url: '/help_page/1' },
      { page_views: 78, unique_views: 23, url: '/home' }
    ]
  end

  describe '.execute' do
    it 'processes the given file' do
      root_dir = File.dirname(File.expand_path(__dir__))

      expect(described_class.execute(File.path("#{root_dir}/support/fixtures/webserver.log"))).to eq(expected_result)
    end
  end
end
