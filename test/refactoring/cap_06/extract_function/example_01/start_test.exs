defmodule Refactoring.Cap06.ExtractFunction.Example01.StartTest do
  use ExUnit.Case

  alias Refactoring.Cap06.ExtractFunction.Example01.{
    Start, Step01, Step02
  }

  setup do
    invoice = %{
      customer: "Igor",
      orders: [
        %{amount: 30},
        %{amount: 7},
        %{amount: 55},
      ]
    }

    %{invoice: invoice}
  end

  test "start test", ctx do
    result = Start.print_owing(ctx.invoice)
  end

  test "step 01", ctx do
    result = Step01.print_owing(ctx.invoice)
  end

  test "step 02", ctx do
    result = Step02.print_owing(ctx.invoice)
  end
end
