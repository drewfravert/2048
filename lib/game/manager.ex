defmodule Game.Manager do
  use GenServer

  # ======================================================================================
  # Configuration
  # ======================================================================================

  alias __MODULE__

  # ======================================================================================
  # Attributes
  # ======================================================================================

  @points Enum.map(1..20, &(:math.pow(2, &1) |> round()))
  @statuses [:initialized, :playing, :won, :continue, :lost]

  # ======================================================================================
  # Client API
  # ======================================================================================

  def check_state(:lost) do
    false
  end

  def check_state(:won, value) do
    value === 2048
  end

  def game_state(pid) do
    GenServer.call(pid, :game_state)
  end

  def increase_score(pid, points) when points in @points do
    GenServer.cast(pid, {:increase_score, points})
  end

  def quit(pid) do
    GenServer.stop(pid)
  end

  def start_link(game) do
    GenServer.start_link(Manager, game)
  end

  # ======================================================================================
  # Server API
  # ======================================================================================

  @impl true
  def init(game) do
    {:ok, game}
  end

  @impl true
  def handle_call(:game_state, _from, game) do
    {:reply, game, game}
  end

  @impl true
  def handle_cast({:increase_score, points}, %Game{score: score} = game) do
    game = %Game{game | score: score + points}

    {:noreply, game}
  end

  @impl true
  def handle_info(_msg, game) do
    {:noreply, game}
  end

  @impl true
  def terminate(_reason, game) do
    IO.inspect(game)

    :ok
  end
end
