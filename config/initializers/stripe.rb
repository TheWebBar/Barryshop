if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_live_rWPz2OHU7RNG7vAotMuPWagw',
    secret_key: 'sk_live_17g4GUc6s76SqOfPsNa2znpm'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
