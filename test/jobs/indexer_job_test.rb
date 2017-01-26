require 'test_helper'

class IndexerJobTest < ActiveJob::TestCase
  setup do
    @index = indices(:wiki)
    @html = <<-HTML
      <h1>Heading 1</h1>
      <h2>Heading 2</h2>
      <h3>Heading 3</h3>
      <a href="https://www.google.com">Google</a>
      <a href="https://www.wikipedia.com">Wikipedia</a>
    HTML
    stub_request(:get, @index.url)
      .to_return(status: 200, body: @html)
  end

  # rubocop:disable Style/StringLiterals
  test 'triggering job should parse url update content and status' do
    IndexerJob.perform_now(@index.id)
    default_hash = { "h1" => "", "h2" => "", "h3" => "", "links" => [] }

    assert @index.reload.indexed?
    assert_not_equal default_hash, @index.reload.content
  end
end
