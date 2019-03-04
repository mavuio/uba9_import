defmodule DI.Rememberloginhash do
  use Ecto.Schema

@primary_key {:ID, :integer, []}
  schema "RememberLoginHash" do
    field :ID, :integer
    field :LastEdited, :naive_datetime
    field :Created, :naive_datetime
    field :DeviceID, :text
    field :Hash, :text
    field :ExpiryDate, :naive_datetime
    field :MemberID, :integer

  end
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, :ID, :ClassName, :LastEdited, :Created, :DeviceID, :Hash, :ExpiryDate, :MemberID)
  end
end
