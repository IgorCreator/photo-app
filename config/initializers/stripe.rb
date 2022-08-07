# For heroku setup
# heroku config:set STRIPE_TEST_SECRET_KEY=yoursecrettestkey
# heroku config:set STRIPE_TEST_PUBLISHABLE_KEY=yourpublishabletestkey

# Locally in .zshrc file - fill in
# export STRIPE_TEST_SECRET_KEY=yoursecrettestkeyfromstripe
# export STRIPE_TEST_PUBLISHABLE_KEY=yourpublishabletestkeyfromstripe

Rails.configuration.stripe = {
  :publishable_key => ENV['STRIPE_TEST_PUBLISHABLE_KEY'],
  :secret_key      => ENV['STRIPE_TEST_SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
