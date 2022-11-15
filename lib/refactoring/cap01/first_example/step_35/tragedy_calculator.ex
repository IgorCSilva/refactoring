defmodule Refactoring.Cap01.FirstExample.Step35.TragedyCalculator do

  defstruct(
    performance: nil,
    play: nil
  )

  alias Refactoring.Cap01.FirstExample.Step35.PerformanceCalculator

  def new(a_performance, a_play) do
    %__MODULE__{
      performance: a_performance,
      play: a_play
    }
  end

  def amount(calculator) do
    result = 40000

    if calculator.performance["audience"] > 30 do
      result + 1000 * (calculator.performance["audience"] - 30)
    else
      result
    end
  end

  def volume_credits(calculator) do
    PerformanceCalculator.volume_credits(calculator)
  end
end
