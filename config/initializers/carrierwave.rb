unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_S3_KEY_ID'],
      aws_secret_access_key: ENV['AWS_S3_SECRET_KEY'],
      region: 'ap-northeast-1'
    }
    config.fog_public = false
    config.fog_directory = ENV['AWS_S3_BUCKET_PRODUCTION']
    config.cache_storage = :fog
  end
end
