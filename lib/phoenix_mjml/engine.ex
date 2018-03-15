defmodule PhoenixMjml.Engine do
  @behaviour Phoenix.Template.Engine

  def compile(path, name) do
    path_to_mjml_binary = Application.fetch_env!(:phoenix_mjml, :mjml_executable)
    {html, 0} = System.cmd("node", [path_to_mjml_binary, path])
    EEx.compile_string(html, engine: engine_for(name), file: path, line: 1, trim: true)
  end

  defp engine_for(name) do
    case Phoenix.Template.format_encoder(name) do
      Phoenix.Template.HTML ->
        unless Code.ensure_loaded?(Phoenix.HTML.Engine) do
          raise "Could not load Phoenix.HTML.Engine to use with .html.eex templates. " <>
                  "You can configure your own format encoder for HTML but we recommend " <>
                  "adding phoenix_html as a dependency as it provides XSS protection."
        end

        Phoenix.HTML.Engine

      _ ->
        EEx.SmartEngine
    end
  end
end
