defmodule Refactoring.Cap01.FirstExample.Step27.CreateStatementData do
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
    result =
      Map.put(
        a_performance,
        "play",
        play_for(a_performance, plays)
      )

    result =
      Map.put(
        result,
        "amount",
        amount_for(result)
      )

    Map.put(
      result,
      "volume_credits",
      volume_credits_for(result)
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

  defp volume_credits_for(a_performance) do
    result = 0

    result = result + max(a_performance["audience"] - 30, 0)
    # Soma um crédito extra para cada dez espectadores de comédia.
    if ("comedy" == a_performance["play"]["type"]) do
      result + floor(a_performance["audience"] / 5)
    else
      result
    end
  end

  defp play_for(a_performance, plays) do
    plays[a_performance["playID"]]
  end

  defp amount_for(a_performance) do
    case a_performance["play"]["type"] do
      "tragedy" ->
        result = 40000

        if a_performance["audience"] > 30 do
          result + 1000 * (a_performance["audience"] - 30)
        else
          result
        end

      "comedy" ->
        result = 30000

        result =
          if a_performance["audience"] > 20 do
            result + 10000 + 500 * (a_performance["audience"] - 20)
          else
            result
          end

        result + 300 * a_performance["audience"]

      _ -> throw("unknown type: #{a_performance["play"]["type"]}")
    end
  end
end
