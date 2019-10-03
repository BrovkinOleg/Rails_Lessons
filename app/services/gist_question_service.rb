class GistQuestionService

  def initialize(question, client = default_client)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: ENV['GISTS_TOKEN'])
  end

  def call
    @client.create_gist(gist_params)
  end

  private

  def default_client
    @client = nil
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
