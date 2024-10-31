defmodule Flowex.Mixfile do
  use Mix.Project

  def project do
    [
      app: :flowex,
      version: "2.0.0",
      elixir: "~> 1.14",
      package: package(),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),
      test_coverage: [tool: ExCoveralls],
      source_url: "https://github.com/resuelve/flowex",
      docs: [
        main: "Flowex"
      ]
    ]
  end

  defp package do
    [
      organization: "resuelve",
      licenses: [],
      links: %{"GitHub" => "https://github.com/resuelve/flowex"}
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
      {:credo, "~> 1.6.7", only: [:dev, :test]},
      {:elixir_uuid, "~> 1.2"},
      {:excoveralls, "~> 0.12", only: :test},
      {:goth, "~> 1.2.0"},
      {:httpoison, "~> 1.8"},
      {:mock, "~> 0.3.0", only: :test},
      {:poison, "~> 3.1"},
      {:ex_doc, "~> 0.27", only: :dev, runtime: false}
    ]
  end

  defp aliases do
    [
      ci: ["format --check-formatted"]
    ]
  end
end
