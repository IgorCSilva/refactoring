defmodule Refactoring.Cap07.InlineClass.Example01.Main do

  alias Refactoring.Cap07.InlineClass.Example01.Shipping

  def run() do
    a_shipment = %Shipping{shipping_company: "Correios", tracking_number: "1234"}

    a_shipment = a_shipment.__struct__.set_shipping_company(a_shipment, "SEDEX")
    a_shipment = a_shipment.__struct__.set_tracking_number(a_shipment, "555")

    {a_shipment, a_shipment.__struct__.get_shipping_company(a_shipment), a_shipment.__struct__.get_tracking_number(a_shipment), a_shipment.__struct__.get_tracking_info(a_shipment)}

  end
end
