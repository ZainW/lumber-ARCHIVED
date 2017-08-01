# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :lumber,
  namespace: DotaAPI,
  ecto_repos: [DotaAPI.Repo]

# Configures the endpoint
config :lumber, DotaAPIWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "wxODQufuK+vBRcVglxkU6RuN4Y+Pqc0zxYXp9I4GtYbADvLDbOmsXoVxsLKIcKHw",
  render_errors: [view: DotaAPIWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: DotaAPI.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
