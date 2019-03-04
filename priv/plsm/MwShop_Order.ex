defmodule DI.MwshopOrder do
  use Ecto.Schema

@primary_key {:ID, :integer, []}
  schema "MwShop_Order" do
    field :ID, :integer
    field :LastEdited, :naive_datetime
    field :Created, :naive_datetime
    field :TransactionID, :text
    field :OrderNr, :text
    field :Status, :text
    field :PaymentStatus, :text
    field :PaymentTransactionID, :text
    field :PaymentSecret, :text
    field :DeliveryType, :text
    field :PaymentType, :text
    field :BillingFirstname, :text
    field :BillingLastname, :text
    field :BillingCompany, :text
    field :BillingStreet, :text
    field :BillingZip, :text
    field :BillingCity, :text
    field :BillingCountry, :text
    field :BillingEmail, :text
    field :BillingFon, :text
    field :BillingComment, :text
    field :BillingDonation, :text
    field :BillingUseDeliveryAdress, :text
    field :DeliveryFirstname, :text
    field :DeliveryLastname, :text
    field :DeliveryCompany, :text
    field :DeliveryStreet, :text
    field :DeliveryZip, :text
    field :DeliveryCity, :text
    field :DeliveryCountry, :text
    field :DeliveryEmail, :text
    field :DeliveryFon, :text
    field :DeliveryUseDeliveryAdress, :text
    field :TotalItems, :integer
    field :TotalPrice, :float
    field :PromoCode, :text

  end
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, :ID, :ClassName, :LastEdited, :Created, :TransactionID, :OrderNr, :Status, :PaymentStatus, :PaymentTransactionID, :PaymentSecret, :DeliveryType, :PaymentType, :BillingFirstname, :BillingLastname, :BillingCompany, :BillingStreet, :BillingZip, :BillingCity, :BillingCountry, :BillingEmail, :BillingFon, :BillingComment, :BillingDonation, :BillingUseDeliveryAdress, :DeliveryFirstname, :DeliveryLastname, :DeliveryCompany, :DeliveryStreet, :DeliveryZip, :DeliveryCity, :DeliveryCountry, :DeliveryEmail, :DeliveryFon, :DeliveryUseDeliveryAdress, :UseDeliveryAdress, :CartJSON, :TotalItems, :TotalPrice, :PromoCode, :LogJSON)
  end
end
