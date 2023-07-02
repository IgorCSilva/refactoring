defmodule Refactoring.Cap01.FirstExample.Step34.ComedyCalculator do

  defstruct(
    performance: nil,
    play: nil
  )

  def new(a_performance, a_play) do
    %__MODULE__{
      performance: a_performance,
      play: a_play
    }
  end

  def amount(calculator) do
    result = 30000

    result =
      if calculator.performance["audience"] > 20 do
        result + 10000 + 500 * (calculator.performance["audience"] - 20)
      else
        result
      end

    result + 300 * calculator.performance["audience"]
  end
end
