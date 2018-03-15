defmodule PhoenixMjml.EngineTest do
  use ExUnit.Case
  alias PhoenixMjml.Engine

  test "compile a basic mjml template" do
    data = Engine.compile(mjml_path("basic"), "basic.html")

    compiled = File.read!(compiled_path("basic"))

    assert {:safe,
            [
              {:|, [],
               [
                 "",
                 ^compiled
               ]}
            ]} = data
  end

  defp mjml_path(name), do: "test/fixture/#{name}/#{name}.html.mjml"

  defp compiled_path(name), do: "test/fixture/#{name}/#{name}.html"
end
