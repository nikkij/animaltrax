# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :animaltrax,
  ecto_repos: [Animaltrax.Repo]

# Configures the endpoint
config :animaltrax, AnimaltraxWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "pAeIR4oFtB0P4rlqJX66EAclcovojaGY9n4n+X4vZaO83TNXv/RVhnpvmeWlMJSn",
  render_errors: [view: AnimaltraxWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Animaltrax.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
