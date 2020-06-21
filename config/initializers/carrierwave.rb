unless Rails.env.development? || Rails.env.test?
    CarrierWave.configure do |config|
      config.fog_credentials = {
        provider: 'AWS',
        aws_access_key_id: 'AKIAZ4TT36Z7LHUBAGJC',
        aws_secret_access_key: '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',
        region: 'ap-northeast-1'
      }
      config.fog_public = false
      config.fog_directory = 'rails-picture-s3'
      config.cache_storage = :fog
    end
  end