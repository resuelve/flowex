defmodule Flowex.Mixfile do
  use Mix.Project

  def project do
    [
      app:                :flowex,
      version:            "0.1.0",
      elixir:             "~> 1.5",
      start_permanent:    Mix.env == :prod,
      deps:               deps(),
      test_coverage:      [tool: ExCoveralls],
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {Flowex.Application, []},
      extra_applications: [:logger, :httpoison]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo,          "~> 0.8", only: [:dev, :test]},
      {:httpoison,      "~> 0.13"},
      {:mock,           "~> 0.3.0", only: :test},
      {:poison,         "~> 3.1"},
      {:excoveralls,    "~> 0.7", only: :test},
      {:goth,           "~> 0.9.0"},
      {:elixir_uuid,    "~> 1.2" }
    ]
  end
end
