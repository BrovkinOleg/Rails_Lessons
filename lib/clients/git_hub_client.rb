class GitHubClient

  ROOT_ENDPOINT = 'https://api.github.com'.freeze
  ACCESS_TOKEN = 'e3aed642e99fd7791fe37c51fe6164ffa49582e6'.freeze

  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    @http_client.post('gists', params) do |request|
      request.headers['Authorization'] = "token #{ACCESS_TOKEN}"
      request.headers['Content-type'] = 'application/json'
      request.body = params.to_json
    end
  end

  private

  def setup_http_client
    Faraday.new(url: ROOT_ENDPOINT)
  end
end
