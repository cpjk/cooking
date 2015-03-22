# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :cooking, Cooking.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "QGFlMKO+a4n82ZPYQtY+lk3ayRaQKKk6mkQgakMdqwObdRjFBSvebrJY+Nk354vY",
  debug_errors: false,
  pubsub: [
    name: Cooking.PubSub,
    adapter: Phoenix.PubSub.PG2
  ]

config :cooking, Cooking.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "cooking_dev",
  username: "cooking",
  password: "",
  hostname: "localhost"

config :cooking, Cooking.Router,
  session: [
    store: :cookie,
    key: "changeme"
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
