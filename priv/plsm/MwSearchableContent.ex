defmodule DI.Mwsearchablecontent do
  use Ecto.Schema

@primary_key {:ID, :integer, []}
  schema "MwSearchableContent" do
    field :ID, :integer
    field :LastEdited, :naive_datetime
    field :Created, :naive_datetime
    field :Link, :text
    field :MwLink, :text

  end
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, :ID, :ClassName, :LastEdited, :Created, :Text, :Link, :MwLink)
  end
end
