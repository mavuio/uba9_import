defmodule DI.FileVersions do
  use Ecto.Schema

@primary_key {:ID, :integer, []}
  schema "File_Versions" do
    field :ID, :integer
    field :RecordID, :integer
    field :Version, :integer
    field :AuthorID, :integer
    field :PublisherID, :integer
    field :LastEdited, :naive_datetime
    field :Created, :naive_datetime
    field :Name, :text
    field :Title, :text
    field :ParentID, :integer
    field :OwnerID, :integer
    field :FileHash, :text
    field :FileFilename, :text
    field :FileVariant, :text

  end
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, :ID, :RecordID, :Version, :WasPublished, :AuthorID, :PublisherID, :ClassName, :LastEdited, :Created, :Name, :Title, :ShowInSearch, :CanViewType, :CanEditType, :ParentID, :OwnerID, :FileHash, :FileFilename, :FileVariant)
  end
end
