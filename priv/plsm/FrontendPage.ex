defmodule DI.Frontendpage do
  use Ecto.Schema

@primary_key {:ID, :integer, []}
  schema "FrontendPage" do
    field :ID, :integer

  end
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, :ID, :ConfigData)
  end
end
