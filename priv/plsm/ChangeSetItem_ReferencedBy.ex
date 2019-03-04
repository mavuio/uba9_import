defmodule DI.ChangesetitemReferencedby do
  use Ecto.Schema

@primary_key {:ID, :integer, []}
  schema "ChangeSetItem_ReferencedBy" do
    field :ID, :integer
    field :ChangeSetItemID, :integer
    field :ChildID, :integer

  end
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, :ID, :ChangeSetItemID, :ChildID)
  end
end
