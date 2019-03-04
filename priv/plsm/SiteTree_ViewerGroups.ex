defmodule DI.SitetreeViewergroups do
  use Ecto.Schema

@primary_key {:ID, :integer, []}
  schema "SiteTree_ViewerGroups" do
    field :ID, :integer
    field :SiteTreeID, :integer
    field :GroupID, :integer

  end
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, :ID, :SiteTreeID, :GroupID)
  end
end
