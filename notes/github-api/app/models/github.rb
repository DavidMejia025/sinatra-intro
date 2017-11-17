module Github

  class Client
    include HTTParty

    base_uri "https://api.github.com"

    def initialize(token = nil)
      @token = token
      @headers = {
        "User-Agent" => 'Make it Real'
      }
    end

    def gists
      response = self.class.get('/some/endpoint', {
        query: { with: 'paramaters' }
      })
      return response.body
    end

    def create_gist(gist)
      gist = {
        description: gist["description"],
        public: true,
        files: {
          "file1.txt" => {
            content: gist["content"]
          }
        }
      }

      gist = self.class.post('/gists', {
        headers: @headers,
        body: gist.to_json
      })
      gist.parsed_response
    end

  end

end
