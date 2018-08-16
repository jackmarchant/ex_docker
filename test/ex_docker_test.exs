defmodule ExDockerTest do
  use ExUnit.Case
  doctest ExDocker

  test "greets the world" do
    assert ExDocker.hello() == :world
  end
end
