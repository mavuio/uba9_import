defmodule DI.FileLive do
  use Ecto.Schema

@primary_key {:ID, :integer, []}
  schema "File_Live" do
    field :ID, :integer
    field :LastEdited, :naive_datetime
    field :Created, :naive_datetime
    field :Name, :text
    field :Title, :text
    field :Version, :integer
    field :ParentID, :integer
    field :OwnerID, :integer
    field :FileHash, :text
    field :FileFilename, :text
    field :FileVariant, :text

  end
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, :ID, :ClassName, :LastEdited, :Created, :Name, :Title, :ShowInSearch, :CanViewType, :CanEditType, :Version, :ParentID, :OwnerID, :FileHash, :FileFilename, :FileVariant)
  end
end
