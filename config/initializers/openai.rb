OpenAI.configure do |config|
  config.access_token = Rails.application.credentials.config[:openai_key] || ENV['OPENAI_KEY']
  config.organization_id = Rails.application.credentials.config[:openai_organization_id] || ENV['OPENAI_ORGANIZATION_ID']
end
