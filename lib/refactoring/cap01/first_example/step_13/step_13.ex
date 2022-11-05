defmodule Refactoring.Cap01.FirstExample.Step13 do
  def start do
    invoices = File.read!("lib/cap01/invoices.json") |> Jason.decode!()
    plays = File.read!("lib/cap01/plays.json") |> Jason.decode!()

    {invoices, plays}
  end

  def statement(invoice, plays) do

    total_amount = 0
    result =
    """
    Statement for #{invoice["customer"]}
    """

    {result, total_amount} =
      Enum.reduce(
        invoice["performances"],
        {result, total_amount},
        fn perf, {result, total_amount} ->

          # Exibe a linha para esta requisição.
          result = result <>
          """
            #{play_for(perf, plays)["name"]}: $#{usd(amount_for(perf, plays))} (#{perf["audience"]} seats)
          """

          total_amount = total_amount + amount_for(perf, plays)

          {result, total_amount}
      end)

    volume_credits = total_volume_credits(invoice, plays)

    result = result <>
    """
    Amount owed is $#{usd(total_amount)}
    """
    result = result <>
    """
    You earned $#{volume_credits} credits
    """

    result
  end

  def total_volume_credits(invoice, plays) do
    volume_credits = 0
    Enum.reduce(
      invoice["performances"],
      volume_credits,
      fn perf, volume_credits ->

        # Soma créditos por volume.
        volume_credits + volume_credits_for(perf, plays)
    end)
  end

  def usd(a_number) do
    number_format(
      "en-US",
      %{
        style: "currency",
        currency: "USD",
        minimum_fraction_digits: 2
      }
    ).(a_number / 100)
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
