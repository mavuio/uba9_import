defmodule DI.Helptip do
  use Ecto.Schema

@primary_key {:ID, :integer, []}
  schema "HelpTip" do
    field :ID, :integer
    field :LastEdited, :naive_datetime
    field :Created, :naive_datetime
    field :Title, :text
    field :CharID, :text

  end
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, :ID, :ClassName, :LastEdited, :Created, :Title, :CharID, :Text)
  end
end
