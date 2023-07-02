defmodule Refactoring.Cap07.EncapsulateRecord.Example02.CustomerData do
  defstruct(
    data: nil
  )

  def new(data) do
    %__MODULE__{
      data: data
    }
  end

  def set_usage(customer_data, customer_id, year, month, amount) do
    data = Map.from_struct(customer_data)
    updated = update_in(data, [customer_id, :usages, year, month], fn _ -> amount end)

    struct(__MODULE__, updated)
  end

  def raw_data(customer_data) do
    customer_data.data
  end

  def usage(customer_data, customer_id, year, month) do
    customer_data[customer_id].usages[year][month]
  end
end
