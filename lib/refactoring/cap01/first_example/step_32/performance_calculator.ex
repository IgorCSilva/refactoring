defmodule Refactoring.Cap01.FirstExample.Step32.PerformanceCalculator do
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
    case calculator.play["type"] do
      "tragedy" ->
        result = 40000

        if calculator.performance["audience"] > 30 do
          result + 1000 * (calculator.performance["audience"] - 30)
        else
          result
        end

      "comedy" ->
        result = 30000

        result =
          if calculator.performance["audience"] > 20 do
            result + 10000 + 500 * (calculator.performance["audience"] - 20)
          else
            result
          end

        result + 300 * calculator.performance["audience"]

      _ -> throw("unknown type: #{calculator.play["type"]}")
    end
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
