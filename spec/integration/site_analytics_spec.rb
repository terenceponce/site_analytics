# frozen_string_literal: true

require 'site_analytics'

RSpec.describe SiteAnalytics do
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

  describe '.execute' do
    it 'processes the given file' do
      root_dir = File.dirname(File.expand_path(__dir__))

      expect(described_class.execute(File.path("#{root_dir}/support/fixtures/webserver.log"))).to eq(expected_result)
    end
  end
end
