# Serializer for indexes.
class IndexSerializer < ActiveModel::Serializer
  attributes :id, :url, :content
end
