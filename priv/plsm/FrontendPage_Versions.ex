defmodule DI.FrontendpageVersions do
  use Ecto.Schema

@primary_key {:ID, :integer, []}
  schema "FrontendPage_Versions" do
    field :ID, :integer
    field :RecordID, :integer
    field :Version, :integer

  end
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, :ID, :RecordID, :Version, :ConfigData)
  end
end
