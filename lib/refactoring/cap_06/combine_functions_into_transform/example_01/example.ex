defmodule Refactoring.Cap06.CombineFunctionsIntoTransform.Example01.Example do
  @reading %{
    customer: "ivan",
    quantity: 10,
    month: 5,
    year: 2017
  }

  defp enrich_reading(original)  do
    result = Map.put(original, :base_charge, calculate_base_charge(original))
    result = Map.put(result, :taxable_charge, max(0, result.base_charge - tax_threshold(result.year)))

    result
  end

  def client1 do
    raw_reading = @reading
    a_reading = enrich_reading(raw_reading)
    base_charge = a_reading.base_charge
  end

  def client2 do
    raw_reading = @reading
    a_reading = enrich_reading(raw_reading)
    taxable_charge = a_reading.taxable_charge
  end

  def client3 do
    raw_reading = @reading
    a_reading = enrich_reading(raw_reading)
    basic_charge_amount = a_reading.base_charge
  end

  defp base_rate(_, _) do
  end
  defp tax_threshold(_) do
  end
  defp calculate_base_charge(a_reading) do
    base_rate(a_reading.month, a_reading.year) * a_reading.quantity
  end
end
