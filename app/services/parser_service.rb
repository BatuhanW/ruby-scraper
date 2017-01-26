require 'nokogiri'
require 'open-uri'

# Service for parsing things. Parses h1, h2, h3 and links for given URL.
class ParserService
  def initialize(url)
    @url = url
  end

  def parse
    set_variables
    update_content
    @content
  end

  private

  def set_variables
    # Get formatted content hash with Dummy record.
    @content = Index.new.content
    @doc = Nokogiri::HTML(open(@url))
  end

  def update_content
    # Iterate h1 to h3, update values.
    (1..3).each do |i|
      @content["h#{i}"] = @doc.css("h#{i}").first.children.to_s
    end

    # Iterate through all links and push to content links array.
    @doc.css('a').each do |link|
      @content['links'].push(link.attributes.values.first.value)
    end
  end
end
