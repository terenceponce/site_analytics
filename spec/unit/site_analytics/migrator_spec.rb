# frozen_string_literal: true

require 'site_analytics/migrator'

RSpec.describe SiteAnalytics::Migrator do
  let(:migrator) { described_class.new(env: :test) }
  let(:db) { Sequel.connect('sqlite://test-database.db') }

  describe '#create' do
    after do
      migrator.destroy
    end

    it 'creates the pages table' do
      expect { migrator.create }.to change { db.table_exists?(:pages) }.from(false).to(true)
    end

    it 'creates the views table' do
      expect { migrator.create }.to change { db.table_exists?(:views) }.from(false).to(true)
    end
  end

  describe '#destroy' do
    before do
      migrator.create
    end

    it 'drops the pages table' do
      expect { migrator.destroy }.to change { db.table_exists?(:pages) }.from(true).to(false)
    end

    it 'drops the views table' do
      expect { migrator.destroy }.to change { db.table_exists?(:views) }.from(true).to(false)
    end
  end
end
