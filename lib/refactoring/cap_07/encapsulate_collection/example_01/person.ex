defmodule Refactoring.Cap07.EncapsulateCollection.Example01.Person do
  defstruct(
    name: "",
    courses: []
  )

  def get_name(person) do
    person.name
  end

  def get_courses(person) do
    person.courses
  end

  def add_course(person, a_course) do
    %{person | courses: person.courses ++ [a_course]}
  end

  def remove_course(a_person, a_course) do
    courses = execute_remove(a_person.courses, a_course)
    %{a_person | courses: courses}
  end

  defp execute_remove([], _) do
    []
  end

  defp execute_remove([head | tail], a_course) do
    if head == a_course do
      tail
    else
      [head | execute_remove(tail, a_course)]
    end
  end
end
