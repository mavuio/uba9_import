defmodule DI.SitetreeImagetracking do
  use Ecto.Schema

@primary_key {:ID, :integer, []}
  schema "SiteTree_ImageTracking" do
    field :ID, :integer
    field :SiteTreeID, :integer
    field :FileID, :integer
    field :FieldName, :text

  end
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, :ID, :SiteTreeID, :FileID, :FieldName)
  end
end
