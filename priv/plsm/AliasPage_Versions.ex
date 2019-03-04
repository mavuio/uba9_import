defmodule DI.AliaspageVersions do
  use Ecto.Schema

@primary_key {:ID, :integer, []}
  schema "AliasPage_Versions" do
    field :ID, :integer
    field :RecordID, :integer
    field :Version, :integer
    field :SourcePageID, :integer
    field :LocalRootID, :integer

  end
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, :ID, :RecordID, :Version, :AliasSubPages, :SourcePageID, :LocalRootID)
  end
end
