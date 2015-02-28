use Mix.Config

config :cooking, Cooking.Endpoint,
  http: [port: System.get_env("PORT") || 2222],
  debug_errors: true,
  cache_static_lookup: false

# Enables code reloading for development
config :phoenix, :code_reloader, true

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"
