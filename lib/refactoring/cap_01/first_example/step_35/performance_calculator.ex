defmodule Refactoring.Cap01.FirstExample.Step35.PerformanceCalculator do
  alias Refactoring.Cap01.FirstExample.Step35.{ComedyCalculator, TragedyCalculator}

  def create(a_performance, a_play) do
    case a_play["type"] do
      "tragedy" -> TragedyCalculator.new(a_performance, a_play)
      "comedy" -> ComedyCalculator.new(a_performance, a_play)
      _ -> throw("unknown type: #{a_play["type"]}")
    end
  end

  def amount(_calculator) do
    throw("struct child responsibility")
  end

  def volume_credits(calculator) do
    max(calculator.performance["audience"] - 30, 0)
  end
end
