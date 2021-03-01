# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :rocketpay_elixir,
  ecto_repos: [RocketpayElixir.Repo]

config :rocketpay_elixir, RocketpayElixir.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

# Configures the endpoint
config :rocketpay_elixir, RocketpayElixirWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "l+X0i6XyZzVdAvPxCr0Go7cAtFglFO8WufYpbjAYECsKZglbvLgraOv7BRj6YfQm",
  render_errors: [view: RocketpayElixirWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: RocketpayElixir.PubSub,
  live_view: [signing_salt: "hNIQ+xif"]

config :rocketpay_elixir, :basic_auth,
  username: "banana",
  password: "nanica123"

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
