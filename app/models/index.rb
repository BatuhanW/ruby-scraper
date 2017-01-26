# Triggers background job with given link to update it's content.
# Index.create(url: 'https://wikipedia.com')
class Index < ApplicationRecord
  enum status: { pending: 10, indexed: 20 }

  validate :url, :url_validator

  after_create :run_indexer_job

  private

  def url_validator
    parsed_url = URI.parse(url)
    conditions = [parsed_url.scheme.present?, parsed_url.host.present?]
    errors.add :url, 'must be valid url' unless conditions[0] && conditions[1]
  end

  def run_indexer_job
    IndexerJob.perform_later(id)
  end
end
