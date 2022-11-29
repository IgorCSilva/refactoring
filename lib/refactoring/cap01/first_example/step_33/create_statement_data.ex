defmodule Refactoring.Cap01.FirstExample.Step33.CreateStatementData do

  alias Refactoring.Cap01.FirstExample.Step33.PerformanceCalculator

  def create_statement_data(invoice, plays) do
    statement_data = %{
      customer: invoice["customer"],
      performances: invoice["performances"]
                    |> Enum.map(fn a_performance ->
                      enrich_performance(a_performance, plays)
                    end)
    }

    statement_data = Map.put(
      statement_data,
      :total_amount,
      total_amount(statement_data)
    )

    statement_data = Map.put(
      statement_data,
      :total_volume_credits,
      total_volume_credits(statement_data)
    )

    statement_data
  end

  defp enrich_performance(a_performance, plays) do
    calculator = PerformanceCalculator.create(a_performance, play_for(a_performance, plays))
    calculator_module = calculator.__struct__()

    result =
      Map.put(
        a_performance,
        "play",
        calculator.play
      )

    result =
      Map.put(
        result,
        "amount",
        calculator_module.amount(calculator)
      )

    Map.put(
      result,
      "volume_credits",
      PerformanceCalculator.volume_credits(calculator)
    )
  end

  defp total_amount(data) do
    result = 0

    Enum.reduce(
      data.performances,
      result,
      fn perf, result ->
        result + perf["amount"]
    end)
  end

  defp total_volume_credits(data) do
    volume_credits = 0
    Enum.reduce(
      data.performances,
      volume_credits,
      fn perf, volume_credits ->

        # Soma créditos por volume.
        volume_credits + perf["volume_credits"]
    end)
  end

  defp play_for(a_performance, plays) do
    plays[a_performance["playID"]]
  end
end
