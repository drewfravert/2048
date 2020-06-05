defmodule Game.Rules do
  @moduledoc false

  # ======================================================================================
  # Configuration
  # ======================================================================================

  alias __MODULE__

  # ======================================================================================
  # Schema
  # ======================================================================================

  defstruct state: :initialized

  # ======================================================================================
  # Public Functions
  # ======================================================================================

  def new(), do: %Rules{}

  # ======================================================================================
  # Private Functions
  # ======================================================================================
end
