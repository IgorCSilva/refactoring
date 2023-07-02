defmodule Refactoring.Cap07.InlineClass.Example01.TrackingInformation do
  defstruct(
    shipping_company: "",
    tracking_number: ""
  )

  def get_shipping_company(ti) do
    ti.shipping_company
  end
  def set_shipping_company(ti, arg) do
    %{ti | shipping_company: arg}
  end

  def get_tracking_number(ti) do
    ti.tracking_number
  end
  def set_tracking_number(ti, arg) do
    %{ti | tracking_number: arg}
  end

  def get_display(ti) do
    "#{ti.shipping_company}: #{ti.tracking_number}"
  end
end
