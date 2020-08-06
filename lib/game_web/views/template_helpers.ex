defmodule GameWeb.TemplateHelpers do
  @moduledoc false

  def active_path?(conn, path) do
    current_path = Path.join(["/" | conn.path_info])

    if path === current_path, do: "active"
  end
end
