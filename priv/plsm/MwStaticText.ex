defmodule DI.Mwstatictext do
  use Ecto.Schema

@primary_key {:ID, :integer, []}
  schema "MwStaticText" do
    field :ID, :integer
    field :LastEdited, :naive_datetime
    field :Created, :naive_datetime
    field :Entity, :text
    field :Scope, :text
    field :Context, :text

  end
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, :ID, :ClassName, :LastEdited, :Created, :Entity, :Scope, :String, :Context)
  end
end
