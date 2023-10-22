require 'rails_helper'
RSpec.describe "POST /graphql books" do

  def graphql!(query_string:, variables: {}, context: {})
    GraphqlBooksSchema.execute(query_string, variables:, context:)
  end
  describe '#books' do
    it 'returns only id of books' do
      query_string = <<-GRAPHQL
        query {
          books {
            id
          }
        }
      GRAPHQL

      result = graphql!(query_string:)

      expect(result['data']['books']).to be_an(Array)
    end
  end
end