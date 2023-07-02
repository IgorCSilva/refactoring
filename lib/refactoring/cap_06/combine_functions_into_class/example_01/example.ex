defmodule Refactoring.Cap06.CombineFunctionsIntoClass.Example01.Example do
  @reading %{
    customer: "ivan",
    quantity: 10,
    month: 5,
    year: 2017
  }

  alias Refactoring.Cap06.CombineFunctionsIntoClass.Example01.Reading

  def client1 do
    raw_reading = @reading
    a_reading = Reading.new(raw_reading)
    base_charge = a_reading.__struct__.base_charge(a_reading)
  end

  def client2 do
    raw_reading = @reading
    a_reading = Reading.new(raw_reading)
    taxable_charge = a_reading.__struct__.taxable_charge(a_reading)
  end

  def client3 do
    raw_reading = @reading
    a_reading = Reading.new(raw_reading)
    basic_charge_amount = a_reading.__struct__.base_charge(a_reading)
  end
end
