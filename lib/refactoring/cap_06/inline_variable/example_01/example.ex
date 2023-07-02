defmodule Refactoring.Cap06.InlineVariable.Example01.Example do

  def call(an_order) do
    an_order.base_price > 1000
  end
end
