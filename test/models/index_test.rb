require 'test_helper'

class IndexTest < ActiveSupport::TestCase
  include ActiveJob::TestHelper

  setup do
    @index = Index.new(url: 'https://google.com')
  end

  # rubocop:disable Style/StringLiterals
  test 'must have default json' do
    default_hash = { "h1" => "", "h2" => "", "h3" => "", "links" => [] }
    @index = Index.new
    assert_equal default_hash, @index.content
  end

  test 'must have default status' do
    @index.save
    assert @index.pending?
  end

  test 'must have url' do
    @index.url.clear
    @index.save
    assert @index.errors.messages.include?(:url)
  end

  test 'url must be valid' do
    invalid_urls = %w(wikipedia http:// wikipedia.com)
    invalid_urls.each do |url|
      @index.url = url
      @index.save
      assert @index.errors.messages.include?(:url)
    end
  end

  test 'creating index record must trigger job' do
    assert_enqueued_with(job: IndexerJob) do
      @index.save
    end
  end
end
