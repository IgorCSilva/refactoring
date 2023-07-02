defmodule Refactoring.Cap07.EncapsulateRecord.Example01.Organization do
  defstruct(
    name: "",
    country: ""
  )

  def new(data) do
    %__MODULE__{
      name: data.name,
      country: data.country
    }
  end

  def set_name(organization, name) do
    %{organization | name: name}
  end

  def get_name(%__MODULE__{name: name}) do
    name
  end

  def set_country(organization, country) do
    %{organization | country: country}
  end

  def get_country(%__MODULE__{country: country}) do
    country
  end
end
