defmodule Refactoring.Cap06.SplitPhase.Example01.Example do

  def price_order(product, quantity, shipping_method) do
    price_data = calculate_pricing_data(product, quantity)
    apply_shipping(price_data, shipping_method)
  end

  def calculate_pricing_data(product, quantity) do
    base_price = product.base_price * quantity

    discount = max(quantity - product.discount_threshold, 0) * product.base_price * product.discount_rate

    %{
      base_price: base_price,
      quantity: quantity,
      discount: discount
    }
  end

  def apply_shipping(price_data, shipping_method) do
    shipping_per_case = (if price_data.base_price > shipping_method.discount_theshold, do: shipping_method.discount_fee, else: shipping_method.fee_per_case)

    shipping_cost = price_data.quantity * shipping_per_case
    price_data.base_price - price_data.discount + shipping_cost
  end
end
