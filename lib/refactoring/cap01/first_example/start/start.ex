defmodule Refactoring.Cap01.FirstExample.Start do
  def read_files do
    invoices = File.read!("lib/refactoring/cap01/first_example/start/invoices.json") |> Jason.decode!()
    plays = File.read!("lib/refactoring/cap01/first_example/start/plays.json") |> Jason.decode!()

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
    Enum.reduce(invoice["performances"], {result, total_amount, volume_credits}, fn perf, {result, total_amount, volume_credits} ->

      play = plays[perf["playID"]]

      this_amount =
        case play["type"] do
          "tragedy" ->
            this_amount = 40000

            if perf["audience"] > 30 do
              this_amount + 1000 * (perf["audience"] - 30)
            else
              this_amount
            end

          "comedy" ->
            this_amount = 30000

            this_amount =
              if perf["audience"] > 20 do
                this_amount + 10000 + 500 * (perf["audience"] - 20)
              else
                this_amount
              end

            this_amount + 300 * perf["audience"]

          _ -> throw("unknown type: #{play["type"]}")
        end

      # Soma créditos por volume.
      volume_credits = volume_credits + max(perf["audience"] - 30, 0)
      # Soma um crédito extra para cada dez espectadores de comédia.
      volume_credits =
        if ("comedy" == play["type"]) do
          volume_credits + floor(perf["audience"] / 5)
        else
          volume_credits
        end

      # Exibe a linha para esta requisição.
      result = result <>
      """
        #{play["name"]}: $#{format.(this_amount / 100)} (#{perf["audience"]} seats)
      """

      total_amount = total_amount + this_amount

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

  defp number_format(locale_code, format_info) do

    case {locale_code, format_info} do
      {"en-US", %{style: "currency", currency: "USD", minimum_fraction_digits: qty}} ->
        (fn value -> :erlang.float_to_binary(value, [{:decimals, qty}]) end)

      _ -> (fn value -> value end)
    end
  end
end
