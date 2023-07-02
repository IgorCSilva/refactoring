defmodule Refactoring.Cap07.EncapsulateRecord.Example02.Main do

  alias Refactoring.Cap07.EncapsulateRecord.Example02.CustomerData

  def run do
    customer_id = :"1920"
    year = :"2015"
    month = :"1"
    amount = 100

    data = get_customer_data().__struct__.set_usage(get_customer_data(), customer_id, year, month, amount)
  end


  def compare_usage(customer_id, later_year, month) do
    later = get_customer_data().__struct__.usage(get_customer_data(), customer_id, later_year, month)

    previous_year = ((to_string(later_year) |> String.to_integer()) - 1) |> to_string() |> String.to_atom()

    earlier = get_customer_data().__struct__.usage(get_customer_data(), customer_id, previous_year, month)

    %{
      later_amount: later,
      change: later - earlier
    }
  end

  @customer_data CustomerData.new(
    %{
      "1920": %{
        name: "martin",
        id: "1920",
        usages: %{
          "2016": %{
            "1": 50,
            "2": 55
          },
          "2015": %{
            "1": 70,
            "2": 63
          }
        }
      },
      "38673": %{
        name: "Neal",
        id: "38673",
        usages: %{
          "2016": %{
            "1": 50,
            "2": 55
          },
          "2015": %{
            "1": 70,
            "2": 63
          }
        }
      }
    }
  )

  def get_customer_data do
    @customer_data
  end

  def get_raw_data_of_customers do
    @customer_data.__struct__.raw_data(@customer_data)
  end

  def set_raw_data_of_customers(arg) do
    CustomerData.new(arg)
  end
end
