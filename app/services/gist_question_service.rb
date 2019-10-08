class GistQuestionService

  def initialize(question, client = default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    @client.create_gist(gist_params)
  end

  def success?
    !!gist_url
  end

  def hash
    gist_url.split('/')[-1]
  end

  def gist_url
    @client.last_response.data[:html_url]
  end

  private

  def default_client
    # @client = Octokit::Client.new(access_token: ENV['GISTS_TOKEN'])
    @client = Octokit::Client.new(access_token: '06830871a8487fda75a6d91637fd32dc7a0c4703')
  end

  def gist_params
    {
      descriptiion: "A question about #{@test.title} from TestGuru",
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end
