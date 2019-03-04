defmodule DI.SitetreeLinktracking do
  use Ecto.Schema

@primary_key {:ID, :integer, []}
  schema "SiteTree_LinkTracking" do
    field :ID, :integer
    field :SiteTreeID, :integer
    field :ChildID, :integer
    field :FieldName, :text

  end
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, :ID, :SiteTreeID, :ChildID, :FieldName)
  end
end
