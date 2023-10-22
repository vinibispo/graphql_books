require 'rails_helper'
RSpec.describe "POST /graphql books" do

  def graphql!(query_string:, variables: {}, context: {})
    GraphqlBooksSchema.execute(query_string, variables:, context:)
  end
  describe '#books' do
    it 'returns only id of books' do
      book = FactoryBot.create(:book)

      query_string = <<-GRAPHQL
        query {
          books {
            id
          }
        }
      GRAPHQL

      response = graphql!(query_string:)

      result = response['data']['books'].map { _1["id"] }

      expect(response['data']['books']).to be_an(Array)

      expect(result).to eq([book.id.to_s])
    end

    it 'returns only title, and author' do
      books = FactoryBot.create_list(:book, 2)

      query_string = <<-GRAPHQL
        query {
          books {
            title
            author
          }
        }
      GRAPHQL

      response = graphql!(query_string:)

      expected = books.map { {title: _1.title, author: _1.author }}

      result = response['data']['books'].map { { title: _1["title"], author: _1["author"] }}

      expect(result).to eq(expected)
    end
  end
end
