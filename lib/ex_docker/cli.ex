defmodule ExDocker.Cli do
  require Logger

  @directory "priv"

  @spec main([String.t()]) :: :ok
  def main([]), do: Logger.error(fn -> "Please provide a valid path" end)

  def main([project_name]) do
    res = File.mkdir(project_name)

    build_files(
      [
        "docker-compose.yml",
        "Dockerfile",
        "Makefile"
      ],
      project_name
    )

    case res do
      :ok -> Logger.info(fn -> "Created new project: #{project_name}" end)
      _ -> Logger.info(fn -> "Added docker files to existing project: #{project_name}" end)
    end
  end

  defp build_files([], _), do: :ok

  defp build_files([file | rest], project_name) do
    content = replace_content(file, project_name)

    project_name
    |> Path.join(file)
    |> File.write!(content)

    build_files(rest, project_name)
  end

  defp replace_content(file, project_name) do
    @directory
    |> Path.join(file)
    |> File.read!()
    |> String.replace("$PROJECT_NAME", project_name)
  end
end
