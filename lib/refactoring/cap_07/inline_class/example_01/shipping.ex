defmodule Refactoring.Cap07.InlineClass.Example01.Shipping do
  defstruct(
    shipping_company: "",
    tracking_number: ""
  )

  def get_tracking_info(shipping) do
    "#{shipping.shipping_company}: #{shipping.tracking_number}"
  end

  def set_shipping_company(sp, arg) do
    %{sp | shipping_company: arg}
  end
  def get_shipping_company(sp) do
    sp.shipping_company
  end

  def set_tracking_number(sp, arg) do
    %{sp | tracking_number: arg}
  end
  def get_tracking_number(sp) do
    sp.tracking_number
  end
end
