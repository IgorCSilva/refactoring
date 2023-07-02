defmodule Refactoring.Cap06.ExtractFunction.Example01.Step01 do

  def print_owing(invoice) do
    outstanding = 0

    print_banner()

    # Calcula o valor a pagar (outstanding)
    outstanding =
      Enum.reduce(invoice.orders, outstanding, fn o, acc ->
        acc + o.amount
      end)

    # Registra a data de vencimento (due date)
    today = Date.utc_today()
    invoice = Map.put(invoice, :due_date, today |> Date.add(30))

    # Exibe detalhes
    IO.puts("name: #{invoice.customer}")
    IO.puts("amount: #{outstanding}")
    IO.puts("due: #{invoice.due_date}")
  end

  defp print_banner do
    IO.puts("**********************")
    IO.puts("*** Customer Owes ***")
    IO.puts("**********************")
  end
end
