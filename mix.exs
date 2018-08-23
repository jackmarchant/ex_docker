defmodule ExDocker.MixProject do
  use Mix.Project

  @version "0.1.0"

  def project do
    [
      app: :ex_docker,
      version: @version,
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      escript: escript(),
      description: description(),
      package: package(),
      deps: deps(),
      aliases: aliases()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  def package do
    [
      maintainers: ["Jack Marchant"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/jackmarchant/ex_docker"}
    ]
  end

  def deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end

  def escript do
    [
      main_module: ExDocker.Cli,
      name: :exdocker
    ]
  end

  def aliases do
    [
      build: &build_releases/1
    ]
  end

  defp build_releases(_) do
    Mix.Tasks.Compile.run([])
    Mix.Tasks.Archive.Build.run([])
    Mix.Tasks.Archive.Build.run(["--output=exdocker.ez"])
    File.rename("exdocker.ez", "./archives/exdocker.ez")
    File.rename("exdocker-#{@version}.ez", "./archives/exdocker-#{@version}.ez")
  end

  def description do
    "Dockerise your new or existing Elixir/Phoenix applications in one easy command."
  end
end
