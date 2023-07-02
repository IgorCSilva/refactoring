defmodule Refactoring.Cap06.ChangeFunctionDeclaration.Example03.Example do

  def in_new_england(state_code) do
    state_code in ["MA", "CT", "ME", "VT", "NH", "RI"]
  end

  def client do
    some_customer = %{address: %{state: "AA"}}

    new_englanders = Enum.filter(some_customer, fn c ->
      in_new_england(c.address.state)
    end)
  end
end
