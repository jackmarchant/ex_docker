defmodule ExDocker.Cli do
  require Logger

  @files %{
    "docker-compose.yml" => "priv" |> Path.join("docker-compose.yml") |> File.read!(),
    "Dockerfile" => "priv" |> Path.join("Dockerfile") |> File.read!(),
    "Makefile" => "priv" |> Path.join("Makefile") |> File.read!()
  }

  @spec main([String.t()]) :: :ok
  def main([]), do: Logger.error(fn -> "Please provide a valid path" end)

  def main([project_name]) do
    res = File.mkdir(project_name)

    build_files(Enum.to_list(@files), project_name)

    case res do
      :ok -> Logger.info(fn -> "Created new project: #{project_name}" end)
      _ -> Logger.info(fn -> "Added docker files to existing project: #{project_name}" end)
    end
  end

  defp build_files([], _), do: :ok

  defp build_files([{filename, content} | rest], project_name) do
    content = replace_content(content, project_name)

    project_name
    |> Path.join(filename)
    |> File.write!(content)

    build_files(rest, project_name)
  end

  defp replace_content(string, project_name) do
    String.replace(string, "$PROJECT_NAME", project_name)
  end
end
