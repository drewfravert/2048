defmodule Game.Manager do
  use GenServer

  alias Game.Official

  @points Enum.map(1..20, &(:math.pow(2, &1) |> round()))
  @statuses [:initialized, :playing, :won, :continue, :lost]

  # ======================================================================================
  # Client
  # ======================================================================================

  def get_status(pid) do
    GenServer.call(pid, :get_status)
  end

  def increase_score(pid, points) when points in @points do
    GenServer.cast(pid, {:increase_score, points})
  end

  def start_link() do
    GenServer.start_link(__MODULE__, :ok)
  end

  def update_status(pid, status) when status in @statuses do
    GenServer.cast(pid, {:set_status, status})
  end

  # ======================================================================================
  # Server
  # ======================================================================================

  @impl true
  def init(:ok) do
    {:ok, Game.new()}
  end

  @impl true
  def handle_call(:get_status, _from, %Game{} = game) do
    {:reply, Official.get_status(game), game}
  end

  @impl true
  def handle_cast({:increase_score, points}, %Game{} = game) do
    {:noreply, Official.increase_score(game, points)}
  end

  @impl true
  def handle_cast({:update_status, status}, %Game{} = game) do
    {:noreply, Official.update_status(game, status)}
  end
end
