defmodule RefactoringTest do
  use ExUnit.Case
  doctest Refactoring

  test "greets the world" do
    assert Refactoring.hello() == :world
  end
end
