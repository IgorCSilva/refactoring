defmodule Refactoring.Cap06.ExtractVariable.Example02.Order do
  defstruct(
    data: %{}
  )

  def new(a_record) do
    %__MODULE__{data: a_record}
  end

  def quantity(order) do
    order.data.quantity
  end

  def item_price(order) do
    order.data.item_price
  end

  def price(order) do
    base_price(order) - quantity_discount(order) + shipping(order)
  end

  def base_price(order) do
    quantity(order) * item_price(order)
  end

  def quantity_discount(order) do
    max(0, quantity(order) - 500) * item_price(order) * 0.05
  end

  def shipping(order) do
    min(base_price(order) * 0.1, 100)
  end
end
