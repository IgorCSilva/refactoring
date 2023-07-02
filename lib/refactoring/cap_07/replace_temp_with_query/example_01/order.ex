defmodule Refactoring.Cap07.ReplaceTempWithQuery.Example01.Order do
  defstruct(
    quantity: 0,
    item: nil
  )

  def new(quantity, item) do
    %__MODULE__{
      quantity: quantity,
      item: item
    }
  end

  def get_price(order) do
    get_base_price(order) * get_discount_factor(order)
  end

  defp get_base_price(order) do
    order.quantity * order.price
  end

  defp get_discount_factor(order) do
    discount_factor = 0.98

    if (get_base_price(order) > 1000), do: (discount_factor - 0.03), else: discount_factor
  end
end
