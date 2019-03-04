defmodule DI.Permission do
  use Ecto.Schema

@primary_key {:ID, :integer, []}
  schema "Permission" do
    field :ID, :integer
    field :LastEdited, :naive_datetime
    field :Created, :naive_datetime
    field :Code, :text
    field :Arg, :integer
    field :Type, :integer
    field :GroupID, :integer

  end
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, :ID, :ClassName, :LastEdited, :Created, :Code, :Arg, :Type, :GroupID)
  end
end
