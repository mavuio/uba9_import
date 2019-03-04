defmodule DI.Mwjob do
  use Ecto.Schema

@primary_key {:ID, :integer, []}
  schema "MwJob" do
    field :ID, :integer
    field :LastEdited, :naive_datetime
    field :Created, :naive_datetime
    field :Controller, :text
    field :Method, :text
    field :Started, :naive_datetime

  end
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, :ID, :ClassName, :LastEdited, :Created, :Controller, :Method, :ParametersSerialized, :RunType, :Status, :Started, :Response)
  end
end
