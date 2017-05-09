require 'dotenv'
Dotenv.load

CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: '',
    aws_secret_access_key: '',
    region: 'ap-northeast-1'
  }
  config.fog_directory = 'mikan3rd-chat-space'
end
