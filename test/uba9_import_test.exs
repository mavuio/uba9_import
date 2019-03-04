defmodule DITest do
  use ExUnit.Case
  doctest DI

  test "greets the world" do
    assert DI.hello() == :world
  end
end
