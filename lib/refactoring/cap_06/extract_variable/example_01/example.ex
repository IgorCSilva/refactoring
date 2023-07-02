defmodule Refactoring.Cap06.ExtractVariable.Example01.Example do
  def price(order) do
    # preço é igual ao preço base - desconto por quantidade (quantity discount) + frete (shipping)

    base_price = order.quantity * order.item_price
    quantity_discount = max(0, order.quantity - 500) * order.item_price * 0.05
    shipping = min(base_price * 0.1, 100)

    base_price - quantity_discount + shipping
  end
end
