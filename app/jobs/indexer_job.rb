# Indexes links for given Index ID.
class IndexerJob < ApplicationJob
  queue_as :default

  def perform(index_id)
    @index = Index.find(index_id)
    @parser = ParserService.new(@index.url)

    @index.content = @parser.parse
    @index.status = Index.statuses[:indexed]
    @index.save
  end
end
