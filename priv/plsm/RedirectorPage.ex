defmodule DI.Redirectorpage do
  use Ecto.Schema

@primary_key {:ID, :integer, []}
  schema "RedirectorPage" do
    field :ID, :integer
    field :ExternalURL, :text
    field :LinkToID, :integer

  end
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, :ID, :RedirectionType, :ExternalURL, :LinkToID)
  end
end
