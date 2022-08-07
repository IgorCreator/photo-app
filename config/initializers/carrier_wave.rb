# For heroku setup
# heroku config:set S3_ACCESS_KEY=youraccesskeyforIAMuser
# heroku config:set S3_SECRET_KEY=yoursecretykeyforIAMuser
# heroku config:set S3_BUCKET=yours3bucketname
#
# Example of S3 bucket policy:
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Effect": "Allow",
#       "Action": "s3:*",
#       "Resource": [
#         "arn:aws:s3:::yours3bucketname",
#         "arn:aws:s3:::yours3bucketname/*"
#       ]
#     },
#     {
#       "Effect": "Allow",
#       "Action": "s3:ListAllMyBuckets",
#       "Resource": "arn:aws:s3:::*"
#     }
#   ]
# }

# Locally in .zshrc file - fill in
# export S3_ACCESS_KEY=youraccesskeyforIAMuser
# export S3_SECRET_KEY=yoursecretykeyforIAMuser
# export S3_BUCKET=yours3bucketname

if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      :provider => 'AWS',
      :aws_access_key_id => ENV['S3_ACCESS_KEY'],
      :aws_secret_access_key => ENV['S3_SECRET_KEY']
    }
    config.fog_directory = ENV['S3_BUCKET']
  end
end
