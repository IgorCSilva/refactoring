defmodule Refactoring.Cap01.FirstExample.Start.StartTest do
  use ExUnit.Case
  # doctest Refactoring

  alias Refactoring.Cap01.FirstExample.{
    Start, Step01, Step02, Step03, Step04, Step05,
    Step06, Step07, Step08, Step09, Step10, Step11,
    Step12, Step13, Step14, Step15, Step16, Step17,
    Step18, Step19, Step20, Step21, Step22, Step23,
    Step24, Step25, Step26, Step27, Step28, Step29,
    Step30, Step31, Step32, Step33, Step34, Step35
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

  test "step15 - return statement text", ctx do
    text = Step15.statement(Enum.at(ctx.invoices, 0), ctx.plays)

    assert """
    Statement for BigCo
      Hamlet: $650.00 (55 seats)
      As You Like It: $580.00 (35 seats)
      Othello: $500.00 (40 seats)
    Amount owed is $1730.00
    You earned $47 credits
    """ = text
  end

  test "step16 - return statement text", ctx do
    text = Step16.statement(Enum.at(ctx.invoices, 0), ctx.plays)

    assert """
    Statement for BigCo
      Hamlet: $650.00 (55 seats)
      As You Like It: $580.00 (35 seats)
      Othello: $500.00 (40 seats)
    Amount owed is $1730.00
    You earned $47 credits
    """ = text
  end

  test "step17 - return statement text", ctx do
    text = Step17.statement(Enum.at(ctx.invoices, 0), ctx.plays)

    assert """
    Statement for BigCo
      Hamlet: $650.00 (55 seats)
      As You Like It: $580.00 (35 seats)
      Othello: $500.00 (40 seats)
    Amount owed is $1730.00
    You earned $47 credits
    """ = text
  end

  test "step18 - return statement text", ctx do
    text = Step18.statement(Enum.at(ctx.invoices, 0), ctx.plays)

    assert """
    Statement for BigCo
      Hamlet: $650.00 (55 seats)
      As You Like It: $580.00 (35 seats)
      Othello: $500.00 (40 seats)
    Amount owed is $1730.00
    You earned $47 credits
    """ = text
  end

  test "step19 - return statement text", ctx do
    text = Step19.statement(Enum.at(ctx.invoices, 0), ctx.plays)

    assert """
    Statement for BigCo
      Hamlet: $650.00 (55 seats)
      As You Like It: $580.00 (35 seats)
      Othello: $500.00 (40 seats)
    Amount owed is $1730.00
    You earned $47 credits
    """ = text
  end

  test "step20 - return statement text", ctx do
    text = Step20.statement(Enum.at(ctx.invoices, 0), ctx.plays)

    assert """
    Statement for BigCo
      Hamlet: $650.00 (55 seats)
      As You Like It: $580.00 (35 seats)
      Othello: $500.00 (40 seats)
    Amount owed is $1730.00
    You earned $47 credits
    """ = text
  end

  test "step21 - return statement text", ctx do
    text = Step21.statement(Enum.at(ctx.invoices, 0), ctx.plays)

    assert """
    Statement for BigCo
      Hamlet: $650.00 (55 seats)
      As You Like It: $580.00 (35 seats)
      Othello: $500.00 (40 seats)
    Amount owed is $1730.00
    You earned $47 credits
    """ = text
  end

  test "step22 - return statement text", ctx do
    text = Step22.statement(Enum.at(ctx.invoices, 0), ctx.plays)

    assert """
    Statement for BigCo
      Hamlet: $650.00 (55 seats)
      As You Like It: $580.00 (35 seats)
      Othello: $500.00 (40 seats)
    Amount owed is $1730.00
    You earned $47 credits
    """ = text
  end

  test "step23 - return statement text", ctx do
    text = Step23.statement(Enum.at(ctx.invoices, 0), ctx.plays)

    assert """
    Statement for BigCo
      Hamlet: $650.00 (55 seats)
      As You Like It: $580.00 (35 seats)
      Othello: $500.00 (40 seats)
    Amount owed is $1730.00
    You earned $47 credits
    """ = text
  end

  test "step24 - return statement text", ctx do
    text = Step24.statement(Enum.at(ctx.invoices, 0), ctx.plays)

    assert """
    Statement for BigCo
      Hamlet: $650.00 (55 seats)
      As You Like It: $580.00 (35 seats)
      Othello: $500.00 (40 seats)
    Amount owed is $1730.00
    You earned $47 credits
    """ = text
  end

  test "step25 - return statement text", ctx do
    text = Step25.statement(Enum.at(ctx.invoices, 0), ctx.plays)

    assert """
    Statement for BigCo
      Hamlet: $650.00 (55 seats)
      As You Like It: $580.00 (35 seats)
      Othello: $500.00 (40 seats)
    Amount owed is $1730.00
    You earned $47 credits
    """ = text
  end

  test "step26 - return statement text", ctx do
    text = Step26.statement(Enum.at(ctx.invoices, 0), ctx.plays)

    assert """
    Statement for BigCo
      Hamlet: $650.00 (55 seats)
      As You Like It: $580.00 (35 seats)
      Othello: $500.00 (40 seats)
    Amount owed is $1730.00
    You earned $47 credits
    """ = text
  end

  test "step27 - return statement text", ctx do
    text = Step27.statement(Enum.at(ctx.invoices, 0), ctx.plays)

    assert """
    Statement for BigCo
      Hamlet: $650.00 (55 seats)
      As You Like It: $580.00 (35 seats)
      Othello: $500.00 (40 seats)
    Amount owed is $1730.00
    You earned $47 credits
    """ = text

    html = Step27.html_statement(Enum.at(ctx.invoices, 0), ctx.plays)

    assert """
    <h1>Statement for BigCo</h1>
    <table>
    <tr><th>play</th><th>seats</th><th>cost</th></tr>
    <td>$650.00</td></tr>
    <td>$580.00</td></tr>
    <td>$500.00</td></tr>
    </table>
    <p>Amount owed is <em>$1730.00</em></p>
    <p>You earned <em>$47</em> credits</p>
    """ = html
  end

  test "step28 - return statement text", ctx do
    text = Step28.statement(Enum.at(ctx.invoices, 0), ctx.plays)

    assert """
    Statement for BigCo
      Hamlet: $650.00 (55 seats)
      As You Like It: $580.00 (35 seats)
      Othello: $500.00 (40 seats)
    Amount owed is $1730.00
    You earned $47 credits
    """ = text

    html = Step28.html_statement(Enum.at(ctx.invoices, 0), ctx.plays)

    assert """
    <h1>Statement for BigCo</h1>
    <table>
    <tr><th>play</th><th>seats</th><th>cost</th></tr>
    <td>$650.00</td></tr>
    <td>$580.00</td></tr>
    <td>$500.00</td></tr>
    </table>
    <p>Amount owed is <em>$1730.00</em></p>
    <p>You earned <em>$47</em> credits</p>
    """ = html
  end

  test "step29 - return statement text", ctx do
    text = Step29.statement(Enum.at(ctx.invoices, 0), ctx.plays)

    assert """
    Statement for BigCo
      Hamlet: $650.00 (55 seats)
      As You Like It: $580.00 (35 seats)
      Othello: $500.00 (40 seats)
    Amount owed is $1730.00
    You earned $47 credits
    """ = text

    html = Step29.html_statement(Enum.at(ctx.invoices, 0), ctx.plays)

    assert """
    <h1>Statement for BigCo</h1>
    <table>
    <tr><th>play</th><th>seats</th><th>cost</th></tr>
    <td>$650.00</td></tr>
    <td>$580.00</td></tr>
    <td>$500.00</td></tr>
    </table>
    <p>Amount owed is <em>$1730.00</em></p>
    <p>You earned <em>$47</em> credits</p>
    """ = html
  end

  test "step30 - return statement text", ctx do
    text = Step30.statement(Enum.at(ctx.invoices, 0), ctx.plays)

    assert """
    Statement for BigCo
      Hamlet: $650.00 (55 seats)
      As You Like It: $580.00 (35 seats)
      Othello: $500.00 (40 seats)
    Amount owed is $1730.00
    You earned $47 credits
    """ = text

    html = Step30.html_statement(Enum.at(ctx.invoices, 0), ctx.plays)

    assert """
    <h1>Statement for BigCo</h1>
    <table>
    <tr><th>play</th><th>seats</th><th>cost</th></tr>
    <td>$650.00</td></tr>
    <td>$580.00</td></tr>
    <td>$500.00</td></tr>
    </table>
    <p>Amount owed is <em>$1730.00</em></p>
    <p>You earned <em>$47</em> credits</p>
    """ = html
  end

  test "step31 - return statement text", ctx do
    text = Step31.statement(Enum.at(ctx.invoices, 0), ctx.plays)

    assert """
    Statement for BigCo
      Hamlet: $650.00 (55 seats)
      As You Like It: $580.00 (35 seats)
      Othello: $500.00 (40 seats)
    Amount owed is $1730.00
    You earned $47 credits
    """ = text

    html = Step31.html_statement(Enum.at(ctx.invoices, 0), ctx.plays)

    assert """
    <h1>Statement for BigCo</h1>
    <table>
    <tr><th>play</th><th>seats</th><th>cost</th></tr>
    <td>$650.00</td></tr>
    <td>$580.00</td></tr>
    <td>$500.00</td></tr>
    </table>
    <p>Amount owed is <em>$1730.00</em></p>
    <p>You earned <em>$47</em> credits</p>
    """ = html
  end

  test "step32 - return statement text", ctx do
    text = Step32.statement(Enum.at(ctx.invoices, 0), ctx.plays)

    assert """
    Statement for BigCo
      Hamlet: $650.00 (55 seats)
      As You Like It: $580.00 (35 seats)
      Othello: $500.00 (40 seats)
    Amount owed is $1730.00
    You earned $47 credits
    """ = text

    html = Step32.html_statement(Enum.at(ctx.invoices, 0), ctx.plays)

    assert """
    <h1>Statement for BigCo</h1>
    <table>
    <tr><th>play</th><th>seats</th><th>cost</th></tr>
    <td>$650.00</td></tr>
    <td>$580.00</td></tr>
    <td>$500.00</td></tr>
    </table>
    <p>Amount owed is <em>$1730.00</em></p>
    <p>You earned <em>$47</em> credits</p>
    """ = html
  end

  test "step33 - return statement text", ctx do
    text = Step33.statement(Enum.at(ctx.invoices, 0), ctx.plays)

    assert """
    Statement for BigCo
      Hamlet: $650.00 (55 seats)
      As You Like It: $580.00 (35 seats)
      Othello: $500.00 (40 seats)
    Amount owed is $1730.00
    You earned $47 credits
    """ = text

    html = Step33.html_statement(Enum.at(ctx.invoices, 0), ctx.plays)

    assert """
    <h1>Statement for BigCo</h1>
    <table>
    <tr><th>play</th><th>seats</th><th>cost</th></tr>
    <td>$650.00</td></tr>
    <td>$580.00</td></tr>
    <td>$500.00</td></tr>
    </table>
    <p>Amount owed is <em>$1730.00</em></p>
    <p>You earned <em>$47</em> credits</p>
    """ = html
  end

  test "step34 - return statement text", ctx do
    text = Step34.statement(Enum.at(ctx.invoices, 0), ctx.plays)

    assert """
    Statement for BigCo
      Hamlet: $650.00 (55 seats)
      As You Like It: $580.00 (35 seats)
      Othello: $500.00 (40 seats)
    Amount owed is $1730.00
    You earned $47 credits
    """ = text

    html = Step34.html_statement(Enum.at(ctx.invoices, 0), ctx.plays)

    assert """
    <h1>Statement for BigCo</h1>
    <table>
    <tr><th>play</th><th>seats</th><th>cost</th></tr>
    <td>$650.00</td></tr>
    <td>$580.00</td></tr>
    <td>$500.00</td></tr>
    </table>
    <p>Amount owed is <em>$1730.00</em></p>
    <p>You earned <em>$47</em> credits</p>
    """ = html
  end

  test "step35 - return statement text", ctx do
    text = Step35.statement(Enum.at(ctx.invoices, 0), ctx.plays)

    assert """
    Statement for BigCo
      Hamlet: $650.00 (55 seats)
      As You Like It: $580.00 (35 seats)
      Othello: $500.00 (40 seats)
    Amount owed is $1730.00
    You earned $47 credits
    """ = text

    html = Step35.html_statement(Enum.at(ctx.invoices, 0), ctx.plays)

    assert """
    <h1>Statement for BigCo</h1>
    <table>
    <tr><th>play</th><th>seats</th><th>cost</th></tr>
    <td>$650.00</td></tr>
    <td>$580.00</td></tr>
    <td>$500.00</td></tr>
    </table>
    <p>Amount owed is <em>$1730.00</em></p>
    <p>You earned <em>$47</em> credits</p>
    """ = html
  end
end
