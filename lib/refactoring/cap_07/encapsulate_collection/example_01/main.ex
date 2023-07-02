defmodule Refactoring.Cap07.EncapsulateCollection.Example01.Main do
  alias Refactoring.Cap07.EncapsulateCollection.Example01.{Course, Person}

  def run do
    couse_01 = %Course{name: "English", is_advanced: false}
    couse_02 = %Course{name: "Elixir", is_advanced: true}
    couse_03 = %Course{name: "JavaScript", is_advanced: false}

    a_person = %Person{name: "Igor", courses: [couse_01, couse_02, couse_03]}


    num_advanced_courses =
      a_person.courses
      |> Enum.filter(fn course -> course.is_advanced end)
      |> Enum.count()


    # Another client.
    list_of_names = ["Phoenix", "Svelte", "Nuxt"]

    a_person = Enum.reduce(list_of_names, a_person, fn name ->
      a_person.__struct__.add_course(a_person, %Course{name: name, is_advanced: false})
    end)
  end
end
