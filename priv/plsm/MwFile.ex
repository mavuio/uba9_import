defmodule DI.Mwfile do
  use Ecto.Schema

@primary_key {:ID, :integer, []}
  schema "MwFile" do
    field :ID, :integer
    field :LastEdited, :naive_datetime
    field :Created, :naive_datetime
    field :Filename, :text
    field :Tags, :text
    field :Copyright, :text
    field :Keywords, :text
    field :Size, :integer
    field :OldID, :integer
    field :LastParent, :text
    field :OldFilename, :text
    field :ParentID, :integer

  end
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, :ID, :ClassName, :LastEdited, :Created, :Filename, :Tags, :Copyright, :Description, :Keywords, :Size, :IsFolder, :Deleted, :OldID, :LastParent, :OldFilename, :ParentID)
  end
end
