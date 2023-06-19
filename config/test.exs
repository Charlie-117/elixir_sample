import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :elixir_sample, ElixirSampleWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "TSSgX1W4Zv9EzdeQvqSlpXQYCHnVnqS24E9grbbGWo+34qFBTOX7j9B+4NEGzKmT",
  server: false

# In test we don't send emails.
config :elixir_sample, ElixirSample.Mailer,
  adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
