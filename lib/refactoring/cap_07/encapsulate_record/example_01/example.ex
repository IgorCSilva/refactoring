defmodule Refactoring.Cap07.EncapsulateRecord.Example01.Example do

  alias Refactoring.Cap07.EncapsulateRecord.Example01.Organization

  def start do
    result = "<h1>#{get_organization().__struct__.get_name(get_organization())}</h1>"

    new_name = "Acme Parts"
    organization = get_organization().__struct__.set_name(get_organization(), new_name)
  end

  @organization Organization.new(%{name: "Acme Gooseberries", country: "GB"})

  def get_organization do
    @organization
  end
end
