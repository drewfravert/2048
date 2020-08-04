defmodule Game.Player do
  alias __MODULE__

  @enforce_keys [:best, :games, :id, :name]

  defstruct [:best, :games, :id, :name]

  # ======================================================================================
  # Public
  # ======================================================================================

  def new(id \\ random_id())

  def new(id) when is_atom(id) do
    %Player{
      best: %Game{
        finished: nil,
        grid: nil,
        id: :G123,
        player: nil,
        score: 0,
        started: nil,
        status: nil,
        tile: 2
      },
      games: [],
      id: id,
      name: "Anonymous"
    }
  end

  def new(_id) do
    {:error, :invalid_player}
  end

  # ======================================================================================
  # Private
  # ======================================================================================

  defp random_id() do
    make_ref()
    |> inspect()
    |> String.replace(["#", ".", "<", ">"], "")
    |> String.replace("Reference", "P")
    |> String.to_atom()
  end
end
