defmodule DI.Errorpage do
  use Ecto.Schema

@primary_key {:ID, :integer, []}
  schema "ErrorPage" do
    field :ID, :integer
    field :ErrorCode, :integer

  end
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, :ID, :ErrorCode)
  end
end
