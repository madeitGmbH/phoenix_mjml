defmodule PhoenixMjml.MixProject do
  use Mix.Project

  def project do
    [
      app: :phoenix_mjml,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:phoenix, ">= 1.1.0"},
      {:phoenix_html, ">= 2.3.0"},

      # Docs dependencies
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end
end
