defmodule Refactoring.Cap07.EncapsulateCollection.Example01.Course do
  defstruct(
    name: "",
    is_advanced: false
  )

  def get_name(course) do
    course.name
  end

  def get_is_advanced(course) do
    course.is_advanced
  end
end
