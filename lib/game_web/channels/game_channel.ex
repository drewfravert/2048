defmodule GameWeb.GameChannel do
  @moduledoc false

  use GameWeb, :channel

  def join("game:*", _payload, socket) do
    {:ok, socket}
  end
end
