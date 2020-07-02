defmodule CoordinateTest do
  use ExUnit.Case, async: true
  alias Game.Coordinate
  doctest Coordinate

  describe "new/2" do
    test "creates a new struct" do
      assert Coordinate.new(1, 1) === %Coordinate{x: 1, y: 1}
    end
  end
end
