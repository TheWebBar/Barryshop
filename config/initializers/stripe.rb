if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_MDgiee9UOI22dtYpPPi6U1wn',
    secret_key: 'sk_test_XTDS72nEDS1NXOeLHV2fKnXl'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
