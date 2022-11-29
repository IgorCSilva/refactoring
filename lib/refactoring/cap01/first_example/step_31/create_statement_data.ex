defmodule Refactoring.Cap01.FirstExample.Step31.CreateStatementData do

  alias Refactoring.Cap01.FirstExample.Step31.PerformanceCalculator

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
    calculator = PerformanceCalculator.new(a_performance, play_for(a_performance, plays))

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
        PerformanceCalculator.amount(calculator)
      )

    Map.put(
      result,
      "volume_credits",
      volume_credits_for(result, plays)
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

  defp volume_credits_for(a_performance, plays) do
    PerformanceCalculator.new(a_performance, play_for(a_performance, plays))
    |> PerformanceCalculator.volume_credits()
  end

  defp play_for(a_performance, plays) do
    plays[a_performance["playID"]]
  end
end
