class AudioService
  require 'open-uri'

  def initialize(audio_clip)
    @audio_clip = audio_clip
  end

  def text
    whisper_response
  end

  private
  
  def whisper_response
    @audio_clip.audio.open(tmpdir: "/tmp") do |file|
      client = OpenAI::Client.new()
      client.transcribe(
        parameters: {
          prompt: "Only look for english words, and ignore silence and all other background noise",
          model: "whisper-1",
          response_format: 'text',
          file: File.open(file),
        }
      ).parsed_response
    end
  end
end
