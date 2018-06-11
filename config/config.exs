# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :moo,
  ecto_repos: [Moo.Repo]

# Configures the endpoint
config :moo, MooWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "8ECvv3n1P7+urdu/kdAVjqgNVYgL5GAzPAYCo7sgmDDG/FRdXY6BtSlDD9RtgSgE",
  render_errors: [view: MooWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Moo.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
