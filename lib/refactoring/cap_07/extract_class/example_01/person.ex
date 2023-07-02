defmodule Refactoring.Cap07.ExtractClass.Example01.Person do
  defstruct(
    name: "",
    area_code: "",
    number: "",
    telephone_number: nil
  )

  alias Refactoring.Cap07.ExtractClass.Example01.TelephoneNumber

  def new(name, area_code, number) do
    %__MODULE__{
      name: name,
      area_code: area_code,
      number: number,
      telephone_number: TelephoneNumber.new(area_code, number)
    }
  end

  def get_name(%__MODULE__{name: name}) do
    name
  end
  def set_name(person, name) do
    %{person | name: name}
  end

  def get_telephone_number(person) do
    person.telephone_number.__struct__.to_string(person.telephone_number)
  end

  def get_area_code(%__MODULE__{telephone_number: telephone_number}) do
    telephone_number.__struct__.get_area_code(telephone_number)
  end
  def set_area_code(person, area_code) do
    %{
      person |
      telephone_number: person.telephone_number.__struct__.set_area_code(person.telephone_number, area_code)
    }
  end

  def get_number(%__MODULE__{telephone_number: telephone_number}) do
    telephone_number.__struct__.get_number(telephone_number)
  end
  def set_number(person, number) do
    %{
      person |
      telephone_number: person.telephone_number.__struct__.set_number(person.telephone_number, number)
    }
  end
end
