# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :phoenix, :template_engines, mjml: PhoenixMjml.Engine
config :phoenix_mjml, mjml_executable: "node_modules/.bin/mjml"
