class Books::Schema < Types::QueryType
  field :id, ID, null: false
  field :title, String
  field :author, String
  field :published_at, GraphQL::Types::ISO8601Date
end
