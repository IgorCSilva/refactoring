defmodule Refactoring.Cap01.FirstExample.Step28 do

  import Refactoring.Cap01.FirstExample.Step28.CreateStatementData

  def start do
    invoices = File.read!("lib/cap01/invoices.json") |> Jason.decode!()
    plays = File.read!("lib/cap01/plays.json") |> Jason.decode!()

    {invoices, plays}
  end

  def statement(invoice, plays) do
    create_statement_data(invoice, plays)
    |> render_plain_text()
  end

  def html_statement(invoice, plays) do
    create_statement_data(invoice, plays)
    |> render_html()
  end

  def render_html(data) do
    result =
    """
    <h1>Statement for #{data.customer}</h1>
    """

    result = result <>
    """
    <table>
    """

    result = result <>
    """
    <tr><th>play</th><th>seats</th><th>cost</th></tr>
    """

    result =
      Enum.reduce(
        data.performances,
        result,
        fn perf, result ->
          result <>
          """
          <tr><td>#{perf["play"]["name"]}</td><td>#{perf["audience"]}</td>
          """

          result <>
          """
          <td>$#{perf["amount"] |> usd()}</td></tr>
          """
      end)

    result = result <>
    """
    </table>
    """

    result = result <>
    """
    <p>Amount owed is <em>$#{data.total_amount |> usd()}</em></p>
    """

    result = result <>
    """
    <p>You earned <em>$#{data.total_volume_credits}</em> credits</p>
    """

    result
  end

  def render_plain_text(data) do

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
            #{perf["play"]["name"]}: $#{perf["amount"] |> usd()} (#{perf["audience"]} seats)
          """
      end)

    result = result <>
    """
    Amount owed is $#{data.total_amount |> usd()}
    """

    result = result <>
    """
    You earned $#{data.total_volume_credits} credits
    """

    result
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



  defp number_format(locale_code, format_info) do

    case {locale_code, format_info} do
      {"en-US", %{style: "currency", currency: "USD", minimum_fraction_digits: qty}} ->
        (fn value -> :erlang.float_to_binary(value, [{:decimals, qty}]) end)

      _ -> (fn value -> value end)
    end
  end
end
