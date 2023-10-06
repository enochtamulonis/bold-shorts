class AudioService
  require 'open-uri'

  def initialize(short)
    @short = short
  end

  def text
    whisper_response
  end

  private
  
  def whisper_response
    @short.audio.open(tmpdir: "/tmp") do |file|
      client = OpenAI::Client.new()
      response = client.audio.transcribe(
        parameters: {
          prompt: "Only look for english words, and ignore silence and all other background noise",
          model: "whisper-1",
          response_format: 'text',
          file: File.open(file),
        }
      )
      response["text"]
    end
  end
end
