defmodule Refactoring.Cap06.IntroduceParameterObject.Example01.NumberRange do
  defstruct(
    min: 0,
    max: 0
  )

  def contains(range, value) do
    range.min <= value and value <= range.max
  end
end
