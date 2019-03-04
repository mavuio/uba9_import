defmodule DI.Mwfile do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:ID, :id, autogenerate: true}
  schema "MwFile" do
    field(:LastEdited, :naive_datetime)
    field(:Created, :naive_datetime)
    field(:Filename, :string)
    field(:Tags, :string)
    field(:Copyright, :string)
    field(:Keywords, :string)
    field(:Size, :integer)
    field(:OldID, :integer)
    field(:LastParent, :string)
    field(:OldFilename, :string)
    field(:ParentID, :integer)
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(
      params,
      [
        :ID,
        :ClassName,
        :LastEdited,
        :Created,
        :Filename,
        :Tags,
        :Copyright,
        :Description,
        :Keywords,
        :Size,
        :IsFolder,
        :Deleted,
        :OldID,
        :LastParent,
        :OldFilename,
        :ParentID
      ]
    )
  end
end
