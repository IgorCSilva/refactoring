defmodule Refactoring.Cap07.ReplacePrimitiveWithObject.Example01.Order do
  defstruct(
    priority: ""
  )

  alias Refactoring.Cap07.ReplacePrimitiveWithObject.Example01.Priority

  def new(data) do
    %__MODULE__{}
    |> set_priority(data.priority)
  end

  def get_priority_string(%__MODULE__{priority: %Priority{} = priority}) do
    priority.__struct__.to_string(priority)
  end

  def get_priority(order) do
    order.priority
  end

  def set_priority(order, priority) do
    %{order | priority: Priority.new(priority)}
  end
end
