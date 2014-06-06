# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Ticket::Application.config.secret_key_base = '85e5bf458052f83e784a88934908cf5ae9c6bd27d511070718a54947717dc22b142f9aaa1783b01475c2c70028c773e8066888e7369290c0f7573826f0911278'
