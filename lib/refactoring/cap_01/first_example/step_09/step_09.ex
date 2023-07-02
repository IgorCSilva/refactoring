defmodule Refactoring.Cap01.FirstExample.Step09 do
  def start do
    invoices = File.read!("lib/cap01/invoices.json") |> Jason.decode!()
    plays = File.read!("lib/cap01/plays.json") |> Jason.decode!()

    {invoices, plays}
  end

  def statement(invoice, plays) do

    total_amount = 0
    volume_credits = 0
    result =
    """
    Statement for #{invoice["customer"]}
    """

    format = number_format("en-US", %{style: "currency", currency: "USD", minimum_fraction_digits: 2})

    {result, total_amount, volume_credits} =
      Enum.reduce(
        invoice["performances"],
        {result, total_amount, volume_credits},
        fn perf, {result, total_amount, volume_credits} ->

          # // this_amount = amount_for(perf, plays)

          # Soma créditos por volume.
          volume_credits = volume_credits + volume_credits_for(perf, plays)

          # Exibe a linha para esta requisição.
          result = result <>
          """
            #{play_for(perf, plays)["name"]}: $#{format.(amount_for(perf, plays) / 100)} (#{perf["audience"]} seats)
          """

          total_amount = total_amount + amount_for(perf, plays)

          {result, total_amount, volume_credits}
      end)

    result = result <>
    """
    Amount owed is $#{format.(total_amount / 100)}
    """
    result = result <>
    """
    You earned $#{volume_credits} credits
    """

    result
  end

  def volume_credits_for(a_performance, plays) do
    result = 0

    result = result + max(a_performance["audience"] - 30, 0)
    # Soma um crédito extra para cada dez espectadores de comédia.
    if ("comedy" == play_for(a_performance, plays)["type"]) do
      result + floor(a_performance["audience"] / 5)
    else
      result
    end
  end

  def play_for(a_performance, plays) do
    plays[a_performance["playID"]]
  end

  def amount_for(a_performance, plays) do
    case play_for(a_performance, plays)["type"] do
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

      _ -> throw("unknown type: #{play_for(a_performance, plays)["type"]}")
    end
  end

  defp number_format(locale_code, format_info) do

    case {locale_code, format_info} do
      {"en-US", %{style: "currency", currency: "USD", minimum_fraction_digits: qty}} ->
        (fn value -> :erlang.float_to_binary(value, [{:decimals, qty}]) end)

      _ -> (fn value -> value end)
    end
  end
end
