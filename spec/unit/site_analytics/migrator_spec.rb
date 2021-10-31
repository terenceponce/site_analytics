# frozen_string_literal: true

require 'site_analytics/migrator'

RSpec.describe SiteAnalytics::Migrator do
  describe '#create' do
    after do
      described_class.destroy
    end

    it 'creates the pages table' do
      expect { described_class.create }.to change { DB.table_exists?(:pages) }.from(false).to(true)
    end

    it 'creates the views table' do
      expect { described_class.create }.to change { DB.table_exists?(:views) }.from(false).to(true)
    end
  end

  describe '#destroy' do
    before do
      described_class.create
    end

    it 'drops the pages table' do
      expect { described_class.destroy }.to change { DB.table_exists?(:pages) }.from(true).to(false)
    end

    it 'drops the views table' do
      expect { described_class.destroy }.to change { DB.table_exists?(:views) }.from(true).to(false)
    end
  end
end
