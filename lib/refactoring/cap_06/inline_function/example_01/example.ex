defmodule Refactoring.Cap06.InlineFunction.Example01.Example do

  def rating(a_driver) do
    if a_driver.number_of_late_deliveries > 5 do
      2
    else
      1
    end
  end
end
