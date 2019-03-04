defmodule DI.ErrorpageVersions do
  use Ecto.Schema

@primary_key {:ID, :integer, []}
  schema "ErrorPage_Versions" do
    field :ID, :integer
    field :RecordID, :integer
    field :Version, :integer
    field :ErrorCode, :integer

  end
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, :ID, :RecordID, :Version, :ErrorCode)
  end
end
