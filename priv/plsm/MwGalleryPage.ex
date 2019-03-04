defmodule DI.Mwgallerypage do
  use Ecto.Schema

@primary_key {:ID, :integer, []}
  schema "MwGalleryPage" do
    field :ID, :integer
    field :Copyright, :text
    field :FrontImage, :text

  end
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, :ID, :Copyright, :LastMessage, :Intro, :Text, :ImageDataSerialized, :FrontImage)
  end
end
