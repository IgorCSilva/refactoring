defmodule Refactoring.Cap07.ReplacePrimitiveWithObject.Example01.Priority do
  defstruct(
    value: ""
  )

  def new(%__MODULE__{} = value), do: value
  def new(value) do
    if value in legal_values() do
      %__MODULE__{value: value}
    else
      {:error, "Invalid value for Priority."}
    end
  end

  # Mesmo efeito de um get_value. Para os clientes da struct, pedir a representação em string deve se assemelhar mais a uma conversão do que a uma leitura de propriedade.
  def to_string(priority) do
    priority.value
  end

  def equals(priority1, priority2) do
    get_index(priority1) == get_index(priority2)
  end
  def higher_than(priority1, priority2) do
    get_index(priority1) > get_index(priority2)
  end
  def lower_than(priority1, priority2) do
    get_index(priority1) < get_index(priority2)
  end

  defp get_index(priority) do
    Enum.find_index(legal_values(), fn v -> v == __MODULE__.to_string(priority) end)
  end

  defp legal_values() do
    ["low", "normal", "high", "rush"]
  end
end
