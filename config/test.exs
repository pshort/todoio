import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :todoio, TodoioWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "lj40sgoZyc/ziDEGBA3wvAvuRVo9Z07YZsPLxjgXcrdMLXDJJyGyZZjyxW3F8lzt",
  server: false

# In test we don't send emails.
config :todoio, Todoio.Mailer,
  adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
