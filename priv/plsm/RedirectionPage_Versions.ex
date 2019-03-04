defmodule DI.RedirectionpageVersions do
  use Ecto.Schema

@primary_key {:ID, :integer, []}
  schema "RedirectionPage_Versions" do
    field :ID, :integer
    field :RecordID, :integer
    field :Version, :integer
    field :TargetMwLink, :text

  end
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, :ID, :RecordID, :Version, :RedirectionTarget, :RedirectionType, :TargetMwLink)
  end
end
