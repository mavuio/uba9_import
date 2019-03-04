defmodule DI.SiteconfigViewergroups do
  use Ecto.Schema

@primary_key {:ID, :integer, []}
  schema "SiteConfig_ViewerGroups" do
    field :ID, :integer
    field :SiteConfigID, :integer
    field :GroupID, :integer

  end
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, :ID, :SiteConfigID, :GroupID)
  end
end
