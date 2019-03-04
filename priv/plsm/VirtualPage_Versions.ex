defmodule DI.VirtualpageVersions do
  use Ecto.Schema

@primary_key {:ID, :integer, []}
  schema "VirtualPage_Versions" do
    field :ID, :integer
    field :RecordID, :integer
    field :Version, :integer
    field :VersionID, :integer
    field :CopyContentFromID, :integer

  end
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, :ID, :RecordID, :Version, :VersionID, :CopyContentFromID)
  end
end
