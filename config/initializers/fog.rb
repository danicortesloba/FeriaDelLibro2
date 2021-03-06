CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     Rails.application.credentials.fetch(:s3_access_key_id),                        # required unless using use_iam_profile
    aws_secret_access_key: Rails.application.credentials.fetch(:s3_secret_access_key),                        # required unless using use_iam_profile
    #use_iam_profile:       true,                         # optional, defaults to false
    region:                'us-east-2',                  # optional, defaults to 'us-east-1'
    #host:                  's3.example.com',             # optional, defaults to nil
    #endpoint:              'https://s3.example.com:8080' # optional, defaults to nil
  }
  config.fog_directory  = 'libratedevelopment'                                      # required
  config.fog_public     = true                                                 # optional, defaults to true
  config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" } # optional, defaults to {}
end
