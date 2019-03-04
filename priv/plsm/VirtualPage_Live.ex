defmodule DI.VirtualpageLive do
  use Ecto.Schema

@primary_key {:ID, :integer, []}
  schema "VirtualPage_Live" do
    field :ID, :integer
    field :VersionID, :integer
    field :CopyContentFromID, :integer

  end
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, :ID, :VersionID, :CopyContentFromID)
  end
end
