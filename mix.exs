defmodule Flowex.Mixfile do
  use Mix.Project

  def project do
    [
      app:                :flowex,
      version:            "1.0.0",
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
      {:elixir_uuid,    "~> 1.2" },
      {:excoveralls,    "~> 0.10", only: :test},
      {:goth,           "~> 0.9.0"},
      {:httpoison,      "~> 1.4"},
      {:mock,           "~> 0.3.0", only: :test},
      {:poison,         "~> 3.1"},
    ]
  end
end
