defmodule Refactoring.Cap07.ReplacePrimitiveWithObject.Example01.Main do

  alias Refactoring.Cap07.ReplacePrimitiveWithObject.Example01.{Order, Priority}

  def execute() do
    order1 = Order.new(%{priority: "high"})
    order2 = Order.new(%{priority: "rush"})
    order3 = Order.new(%{priority: "normal"})

    high_priority_count =
      [order1, order2, order3]
      |> Enum.filter(fn order ->
        priority = order.__struct__.get_priority(order)

        priority.__struct__.higher_than(priority, Priority.new("normal"))
      end)
      |> Enum.count()
  end
end
