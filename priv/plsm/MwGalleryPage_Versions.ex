defmodule DI.MwgallerypageVersions do
  use Ecto.Schema

@primary_key {:ID, :integer, []}
  schema "MwGalleryPage_Versions" do
    field :ID, :integer
    field :RecordID, :integer
    field :Version, :integer
    field :Copyright, :text
    field :FrontImage, :text

  end
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, :ID, :RecordID, :Version, :Copyright, :LastMessage, :Intro, :Text, :ImageDataSerialized, :FrontImage)
  end
end
