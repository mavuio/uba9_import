defmodule DI.Siteconfig do
  use Ecto.Schema

@primary_key {:ID, :integer, []}
  schema "SiteConfig" do
    field :ID, :integer
    field :LastEdited, :naive_datetime
    field :Created, :naive_datetime
    field :Title, :text
    field :Tagline, :text

  end
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, :ID, :ClassName, :LastEdited, :Created, :Title, :Tagline, :CanViewType, :CanEditType, :CanCreateTopLevelType)
  end
end
