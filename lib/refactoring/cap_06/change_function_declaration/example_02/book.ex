defmodule Refactoring.Cap06.ChangeFunctionDeclaration.Example02.Book do
  defstruct(
    reservations: []
  )

  def add_reservation(book, customer) do
    zz_add_reservation(book, customer, false)
  end

  def zz_add_reservation(book, customer, _is_priority) do
    Map.update(book, :reservations, book, fn value ->
      [customer | value]
    end)
  end
end
