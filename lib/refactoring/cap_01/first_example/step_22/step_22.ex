defmodule Refactoring.Cap01.FirstExample.Step22 do
  def start do
    invoices = File.read!("lib/cap01/invoices.json") |> Jason.decode!()
    plays = File.read!("lib/cap01/plays.json") |> Jason.decode!()

    {invoices, plays}
  end

  def statement(invoice, plays) do
    statement_data = %{
      customer: invoice["customer"],
      performances: invoice["performances"]
                    |> Enum.map(fn a_performance ->
                      enrich_performance(a_performance, plays)
                    end)
    }
    render_plain_text(statement_data, plays)
  end

  def render_plain_text(data, plays) do

    result =
    """
    Statement for #{data.customer}
    """

    result =
      Enum.reduce(
        data.performances,
        result,
        fn perf, result ->
          result <>
          """
            #{perf["play"]["name"]}: $#{usd(amount_for(perf, plays))} (#{perf["audience"]} seats)
          """
      end)


    render_plain_text_total_amount_data = %{
      performances: data.performances
    }
    result = result <>
    """
    Amount owed is $#{total_amount(render_plain_text_total_amount_data, plays) |> usd()}
    """

    render_plain_text_total_volume_credits_data = %{
      performances: data.performances
    }
    result = result <>
    """
    You earned $#{total_volume_credits(render_plain_text_total_volume_credits_data, plays)} credits
    """

    result
  end

  def enrich_performance(a_performance, plays) do
    a_performance
    |> Map.put(
      "play",
      play_for(a_performance, plays)
    )
  end

  def total_amount(data, plays) do
    result = 0

    Enum.reduce(
      data.performances,
      result,
      fn perf, result ->
        result + amount_for(perf, plays)
    end)
  end

  def total_volume_credits(data, plays) do
    volume_credits = 0
    Enum.reduce(
      data.performances,
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
    if ("comedy" == a_performance["play"]["type"]) do
      result + floor(a_performance["audience"] / 5)
    else
      result
    end
  end

  def play_for(a_performance, plays) do
    plays[a_performance["playID"]]
  end

  def amount_for(a_performance, plays) do
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

  defp number_format(locale_code, format_info) do

    case {locale_code, format_info} do
      {"en-US", %{style: "currency", currency: "USD", minimum_fraction_digits: qty}} ->
        (fn value -> :erlang.float_to_binary(value, [{:decimals, qty}]) end)

      _ -> (fn value -> value end)
    end
  end
end
