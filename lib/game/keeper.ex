defmodule Game.Keeper do
  use GenServer

  # ======================================================================================
  # Client API
  # ======================================================================================

  def check_status(:lost) do
    false
  end

  def check_status(:won, value) do
    value === 2048
  end

  def game_score(pid) do
    GenServer.call(pid, :game_score)
  end

  def increase_score(pid, points) do
    GenServer.cast(pid, {:increase_score, points})
  end

  def start_link(default) when is_list(default) do
    GenServer.start_link(__MODULE__, default)
  end

  # ======================================================================================
  # Server API
  # ======================================================================================

  @impl true
  def init(score \\ 0) do
    {:ok, score}
  end

  @impl true
  def handle_call(:game_score, _from, score) do
    {:reply, :ok, score}
  end

  @impl true
  def handle_cast({:increase_score, points}, score) do
    {:noreply, score + points}
  end

  @impl true
  def handle_info(_msg, score) do
    {:noreply, score}
  end
end
