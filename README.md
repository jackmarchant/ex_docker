# ExDocker

Dockerise your new or existing Elixir/Phoenix applications in one easy command.

## Installation

[Dockerise](https://www.docker.com) your Elixir project in one simple command.

You need to install this as an executable Escript. By downloading a binary you will be able to run `exdocker my_project` (where `my_project` is the name of the folder in which you would either like to create an Elixir app, or where one already eixsts.) for your Elixir project to be set up with some simple files to help Dockerise it.

1. Make sure `~/.mix/escripts` is in your machine's `$PATH`.
  You can do this by adding `export PATH=~/.mix/escripts:$PATH` to your `.bashrc` or similar file.
2. `mix escript.install hex ex_docker`
3. `source ~/.bashrc`
4. `exdocker hello_docker` -- [info] Created new project: hello_docker
