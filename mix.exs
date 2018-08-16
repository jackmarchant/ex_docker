defmodule ExDocker.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_docker,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      escript: escript()
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
    []
  end

  def escript do
    [main_module: ExDocker.CLI]
  end
end
