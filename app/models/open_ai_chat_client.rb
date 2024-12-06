class OpenAiChatClient
  def initialize
    @client = OpenAI::Client.new
  end

  def chat(messages:)
    response = @client.chat(
      parameters: {
        model: "gpt-4o",
        messages:
      }
    )
    response.dig("choices", 0, "message", "content")
  end
end
