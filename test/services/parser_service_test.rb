require 'test_helper'

class ParserServiceTest < ActiveSupport::TestCase
  setup do
    @index = indices(:wiki)
    @url = 'https://www.google.com'
    @html = <<-HTML
      <h1>Heading 1</h1>
      <h2>Heading 2</h2>
      <h3>Heading 3</h3>
      <a href="https://www.google.com">Google</a>
      <a href="https://www.wikipedia.com">Wikipedia</a>
    HTML
    stub_request(:get, @url)
      .to_return(status: 200, body: @html)
  end

  # rubocop:disable Style/StringLiterals
  test 'should parse given url and send content hash' do
    @service = ParserService.new(@url)
    content_hash = {
      "h1" => "Heading 1",
      "h2" => "Heading 2",
      "h3" => "Heading 3",
      "links" => ['https://www.google.com', 'https://www.wikipedia.com']
    }
    assert_equal content_hash, @service.parse
  end
end
