defmodule Refactoring.Cap06.InlineFunction.Example02.Example do

  def report_lines(a_customer) do
    lines = [] ++ [["name", a_customer.name]]
    lines ++ [["location", a_customer.location]]
  end
end
