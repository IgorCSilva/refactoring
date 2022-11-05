defmodule Refactoring.Cap01.FirstExample.Start.StartTest do
  use ExUnit.Case
  # doctest Refactoring

  alias Refactoring.Cap01.FirstExample.{
    Start, Step01, Step02, Step03, Step04, Step05,
    Step06, Step07, Step08, Step09, Step10, Step11,
    Step12, Step13, Step14
  }

  setup do
    invoices = [
      %{
        "customer" => "BigCo",
        "performances" => [
          %{
            "playID" => "hamlet",
            "audience" => 55
          },
          %{
            "playID" => "as-like",
            "audience" => 35
          },
          %{
            "playID" => "othello",
            "audience" => 40
          }
        ]
      }
    ]

    plays = %{
      "hamlet" => %{
        "name" => "Hamlet",
        "type" => "tragedy"
      },
      "as-like" => %{
        "name" => "As You Like It",
        "type" => "comedy"
      },
      "othello" => %{
        "name" => "Othello",
        "type" => "tragedy"
      }
    }

    %{invoices: invoices, plays: plays}
  end

  test "start - return statement text", ctx do
    text = Start.statement(Enum.at(ctx.invoices, 0), ctx.plays)

    assert """
    Statement for BigCo
      Hamlet: $650.00 (55 seats)
      As You Like It: $580.00 (35 seats)
      Othello: $500.00 (40 seats)
    Amount owed is $1730.00
    You earned $47 credits
    """ = text
  end

  test "step01 - return statement text", ctx do
    text = Step01.statement(Enum.at(ctx.invoices, 0), ctx.plays)

    assert """
    Statement for BigCo
      Hamlet: $650.00 (55 seats)
      As You Like It: $580.00 (35 seats)
      Othello: $500.00 (40 seats)
    Amount owed is $1730.00
    You earned $47 credits
    """ = text
  end

  test "step02 - return statement text", ctx do
    text = Step02.statement(Enum.at(ctx.invoices, 0), ctx.plays)

    assert """
    Statement for BigCo
      Hamlet: $650.00 (55 seats)
      As You Like It: $580.00 (35 seats)
      Othello: $500.00 (40 seats)
    Amount owed is $1730.00
    You earned $47 credits
    """ = text
  end

  test "step03 - return statement text", ctx do
    text = Step03.statement(Enum.at(ctx.invoices, 0), ctx.plays)

    assert """
    Statement for BigCo
      Hamlet: $650.00 (55 seats)
      As You Like It: $580.00 (35 seats)
      Othello: $500.00 (40 seats)
    Amount owed is $1730.00
    You earned $47 credits
    """ = text
  end

  test "step04 - return statement text", ctx do
    text = Step04.statement(Enum.at(ctx.invoices, 0), ctx.plays)

    assert """
    Statement for BigCo
      Hamlet: $650.00 (55 seats)
      As You Like It: $580.00 (35 seats)
      Othello: $500.00 (40 seats)
    Amount owed is $1730.00
    You earned $47 credits
    """ = text
  end

  test "step05 - return statement text", ctx do
    text = Step05.statement(Enum.at(ctx.invoices, 0), ctx.plays)

    assert """
    Statement for BigCo
      Hamlet: $650.00 (55 seats)
      As You Like It: $580.00 (35 seats)
      Othello: $500.00 (40 seats)
    Amount owed is $1730.00
    You earned $47 credits
    """ = text
  end

  test "step06 - return statement text", ctx do
    text = Step06.statement(Enum.at(ctx.invoices, 0), ctx.plays)

    assert """
    Statement for BigCo
      Hamlet: $650.00 (55 seats)
      As You Like It: $580.00 (35 seats)
      Othello: $500.00 (40 seats)
    Amount owed is $1730.00
    You earned $47 credits
    """ = text
  end

  test "step07 - return statement text", ctx do
    text = Step07.statement(Enum.at(ctx.invoices, 0), ctx.plays)

    assert """
    Statement for BigCo
      Hamlet: $650.00 (55 seats)
      As You Like It: $580.00 (35 seats)
      Othello: $500.00 (40 seats)
    Amount owed is $1730.00
    You earned $47 credits
    """ = text
  end

  test "step08 - return statement text", ctx do
    text = Step08.statement(Enum.at(ctx.invoices, 0), ctx.plays)

    assert """
    Statement for BigCo
      Hamlet: $650.00 (55 seats)
      As You Like It: $580.00 (35 seats)
      Othello: $500.00 (40 seats)
    Amount owed is $1730.00
    You earned $47 credits
    """ = text
  end

  test "step09 - return statement text", ctx do
    text = Step09.statement(Enum.at(ctx.invoices, 0), ctx.plays)

    assert """
    Statement for BigCo
      Hamlet: $650.00 (55 seats)
      As You Like It: $580.00 (35 seats)
      Othello: $500.00 (40 seats)
    Amount owed is $1730.00
    You earned $47 credits
    """ = text
  end

  test "step10 - return statement text", ctx do
    text = Step10.statement(Enum.at(ctx.invoices, 0), ctx.plays)

    assert """
    Statement for BigCo
      Hamlet: $650.00 (55 seats)
      As You Like It: $580.00 (35 seats)
      Othello: $500.00 (40 seats)
    Amount owed is $1730.00
    You earned $47 credits
    """ = text
  end

  test "step11 - return statement text", ctx do
    text = Step11.statement(Enum.at(ctx.invoices, 0), ctx.plays)

    assert """
    Statement for BigCo
      Hamlet: $650.00 (55 seats)
      As You Like It: $580.00 (35 seats)
      Othello: $500.00 (40 seats)
    Amount owed is $1730.00
    You earned $47 credits
    """ = text
  end

  test "step12 - return statement text", ctx do
    text = Step12.statement(Enum.at(ctx.invoices, 0), ctx.plays)

    assert """
    Statement for BigCo
      Hamlet: $650.00 (55 seats)
      As You Like It: $580.00 (35 seats)
      Othello: $500.00 (40 seats)
    Amount owed is $1730.00
    You earned $47 credits
    """ = text
  end

  test "step13 - return statement text", ctx do
    text = Step13.statement(Enum.at(ctx.invoices, 0), ctx.plays)

    assert """
    Statement for BigCo
      Hamlet: $650.00 (55 seats)
      As You Like It: $580.00 (35 seats)
      Othello: $500.00 (40 seats)
    Amount owed is $1730.00
    You earned $47 credits
    """ = text
  end

  test "step14 - return statement text", ctx do
    text = Step14.statement(Enum.at(ctx.invoices, 0), ctx.plays)

    assert """
    Statement for BigCo
      Hamlet: $650.00 (55 seats)
      As You Like It: $580.00 (35 seats)
      Othello: $500.00 (40 seats)
    Amount owed is $1730.00
    You earned $47 credits
    """ = text
  end
end
