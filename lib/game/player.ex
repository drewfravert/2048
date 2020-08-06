defmodule Game.Player do
  @moduledoc false

  alias __MODULE__

  @enforce_keys [:best, :games, :id, :name]

  defstruct [:best, :games, :id, :name]

  # ======================================================================================
  # Public
  # ======================================================================================

  def new() do
    %Player{
      best: nil,
      games: [],
      id: random_id(),
      name: "Anonymous"
    }
  end

  # ======================================================================================
  # Private
  # ======================================================================================

  defp random_id() do
    make_ref()
    |> inspect()
    |> String.replace(["Reference", "#", ".", "<", ">"], "")
  end
end
