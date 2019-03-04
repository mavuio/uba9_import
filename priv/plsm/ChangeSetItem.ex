defmodule DI.Changesetitem do
  use Ecto.Schema

@primary_key {:ID, :integer, []}
  schema "ChangeSetItem" do
    field :ID, :integer
    field :LastEdited, :naive_datetime
    field :Created, :naive_datetime
    field :VersionBefore, :integer
    field :VersionAfter, :integer
    field :ChangeSetID, :integer
    field :ObjectID, :integer

  end
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, :ID, :ClassName, :LastEdited, :Created, :VersionBefore, :VersionAfter, :Added, :ChangeSetID, :ObjectID, :ObjectClass)
  end
end
