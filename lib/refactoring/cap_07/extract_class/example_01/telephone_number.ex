defmodule Refactoring.Cap07.ExtractClass.Example01.TelephoneNumber do
  defstruct(
    area_code: "",
    number: ""
  )

  def new(area_code, number) do
    %__MODULE__{
      area_code: area_code,
      number: number
    }
  end

  def get_area_code(%__MODULE__{area_code: area_code}) do
    area_code
  end
  def set_area_code(telephone_number, area_code) do
    %{telephone_number | area_code: area_code}
  end

  def get_number(%__MODULE__{number: number}) do
    number
  end
  def set_number(telephone_number, number) do
    %{telephone_number | number: number}
  end

  def to_string(telephone_number) do
    "(#{telephone_number.area_code}) #{telephone_number.number}"
  end
end
