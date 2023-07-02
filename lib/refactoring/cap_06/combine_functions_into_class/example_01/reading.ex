defmodule Refactoring.Cap06.CombineFunctionsIntoClass.Example01.Reading do
  defstruct(
    customer: "",
    quantity: 0,
    month: 1,
    year: 0
  )

  def new(data) do
    %__MODULE__{
      customer: data.customer,
      quantity: data.quantity,
      month: data.month,
      year: data.year
    }
  end

  def base_charge(a_reading) do
    base_rate(a_reading.month, a_reading.year) * a_reading.quantity
  end

  defp taxable_charge(a_reading) do
    max(0, base_charge(a_reading) - tax_threshold(a_reading.year))
  end


  defp base_rate(_, _) do
  end
  defp tax_threshold(_) do
  end
end
