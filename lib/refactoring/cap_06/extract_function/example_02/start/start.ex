defmodule Refactoring.Cap06.ExtractFunction.Example02.Start do

  def print_owing(invoice) do

    IO.puts("**********************")
    IO.puts("*** Customer Owes ***")
    IO.puts("**********************")

    # Registra a data de vencimento (due date)
    today = Date.utc_today()
    invoice = Map.put(invoice, :due_date, today |> Date.add(30))

    # Exibe detalhes
    IO.puts("name: #{invoice.customer}")
    IO.puts("amount: #{calculate_outstanding(invoice)}")
    IO.puts("due: #{invoice.due_date}")
  end

  defp calculate_outstanding(invoice) do
    # Calcula o valor a pagar (outstanding)
    Enum.reduce(invoice.orders, 0, fn o, acc ->
      acc + o.amount
    end)
  end
end
