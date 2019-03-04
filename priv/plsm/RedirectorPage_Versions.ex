defmodule DI.RedirectorpageVersions do
  use Ecto.Schema

@primary_key {:ID, :integer, []}
  schema "RedirectorPage_Versions" do
    field :ID, :integer
    field :RecordID, :integer
    field :Version, :integer
    field :ExternalURL, :text
    field :LinkToID, :integer

  end
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, :ID, :RecordID, :Version, :RedirectionType, :ExternalURL, :LinkToID)
  end
end
