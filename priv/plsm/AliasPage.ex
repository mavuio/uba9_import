defmodule DI.Aliaspage do
  use Ecto.Schema

@primary_key {:ID, :integer, []}
  schema "AliasPage" do
    field :ID, :integer
    field :SourcePageID, :integer
    field :LocalRootID, :integer

  end
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, :ID, :AliasSubPages, :SourcePageID, :LocalRootID)
  end
end
