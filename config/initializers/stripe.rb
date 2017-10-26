# Store the environment variables on the Rails.configuration object
Rails.configuration.stripe = {
 publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
 secret_key: ENV['STRIPE_SECRET_KEY']

#publishable_key: 'pk_test_VHEp2KARVRirSrHi0puvXHGt',

#secret_key: 'sk_test_ikHnawEW1jqg3Jwj3fH7cr30'
}

# Set our app-stored secret key with Stripe
Stripe.api_key = Rails.configuration.stripe[:secret_key]
