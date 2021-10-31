# frozen_string_literal: true

require 'site_analytics/service/page'

# rubocop:disable RSpec/FilePath
# rubocop:disable Lint/AmbiguousBlockAssociation
RSpec.describe SiteAnalytics::Service::Page do
  describe '.list_pages' do
    before do
      page_a = create(:page)
      page_b = create(:page)

      5.times do
        create(:view, page: page_a)
        create(:view, page: page_b)
      end
    end

    it 'lists all Pages' do
      pages = described_class.list_pages

      expect(pages.count).to eq(2)
    end
  end

  describe '.get_page' do
    context 'with a matching URL' do
      before do
        create(:page, url: '/about')
      end

      it 'returns the Page' do
        page = described_class.get_page('/about')

        expect(page.url).to eq('/about')
      end
    end

    context 'with no matching URL' do
      it 'returns nil' do
        expect(described_class.get_page('/about')).to be(nil)
      end
    end
  end

  describe '.create_page' do
    context 'with the correctly formatted URL' do
      it 'creates a new Page' do
        page = described_class.create_page('/about')

        expect(page.url).to eq('/about')
      end
    end

    context 'with a duplicate URL' do
      before do
        create(:page, url: '/about')
      end

      it 'returns the existing Page instead of adding a new one' do
        expect { described_class.create_page('/about') }.not_to change { described_class.list_pages.count }
      end
    end
  end
end
# rubocop:enable Lint/AmbiguousBlockAssociation
# rubocop:enable RSpec/FilePath
