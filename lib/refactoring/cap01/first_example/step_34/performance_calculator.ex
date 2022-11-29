defmodule Refactoring.Cap01.FirstExample.Step34.PerformanceCalculator do
  defstruct(
    performance: nil,
    play: nil
  )
  alias Refactoring.Cap01.FirstExample.Step34.{ComedyCalculator, TragedyCalculator}

  def create(a_performance, a_play) do
    case a_play["type"] do
      "tragedy" -> TragedyCalculator.new(a_performance, a_play)
      "comedy" -> ComedyCalculator.new(a_performance, a_play)
      _ -> throw("unknown type: #{a_play["type"]}")
    end
  end

  def new(a_performance, a_play) do
    %__MODULE__{
      performance: a_performance,
      play: a_play
    }
  end

  def amount(_calculator) do
    throw("struct child responsibility")
  end

  def volume_credits(calculator) do
    result = 0

    result = result + max(calculator.performance["audience"] - 30, 0)
    # Soma um crédito extra para cada dez espectadores de comédia.
    if ("comedy" == calculator.play["type"]) do
      result + floor(calculator.performance["audience"] / 5)
    else
      result
    end
  end
end
