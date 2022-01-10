import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :fleature_demo, FleatureDemoWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "wUdEhqW68ttieoD9AjNRz07sF+YsFjobMs+hXnopOv6Yb9brHMQhpkWYbfh+0hEk",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
